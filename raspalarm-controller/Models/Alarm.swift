//
//  Alarm.swift
//  raspalarm-controller
//
//  Created by Olivier Chevallier on 16.08.20.
//

import Foundation
import SwiftUI

struct Alarm: Hashable, Codable {
    var id: Int
    var name: String
    var hours: Int
    var minutes: Int
    var rep: [Bool]
    var active: Bool
    var uri: String
    
    private let daysOfWeek = ["Lu", "Ma", "Me", "Je", "Ve", "Sa", "Di"]
    
    public func getFormatedTime() -> String {
        return twoDigitNumber(number: hours) + ":" + twoDigitNumber(number: minutes)
    }
    
    public func getStringRep() -> String {
        if (isEveryDay()) {
            return "Tous les jours"
        } else if(isWeekEnd()) {
            return "Week-end"
        } else if(isWeekDays()) {
            return "Jours de la semaine"
        } else {
            return listDays()
        }
    }
    
    private func twoDigitNumber(number: Int) -> String {
        if(number < 10) {
            return "0" + String(number)
        } else {
            return String(number)
        }
    }
    
    private func isWeekDays() -> Bool {
        let maxIndex = rep.count - 3
        for i in 0...maxIndex {
            if(!rep[i]) {
                return false
            }
        }
        return true
    }
    
    private func isWeekEnd() -> Bool {
        let minIndex = rep.count - 3
        let maxIndex = rep.count - 1
        for i in minIndex...maxIndex {
            if(!rep[i]) {
                return false
            }
        }
        return true
    }
    
    private func isEveryDay() -> Bool {
        let maxIndex = rep.count - 1
        for i in 0...maxIndex {
            if(!rep[i]) {
                return false
            }
        }
        return true
    }
    
    private func listDays() -> String {
        var str = ""
        let maxIndex = rep.count - 1
        for i in 0...maxIndex {
            if(rep[i]) {
                if (str != "") {
                    str += "-"
                }
                str += daysOfWeek[i]
            }
        }
        return str
    }
}
