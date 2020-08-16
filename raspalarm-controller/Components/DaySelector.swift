//
//  DaySelector.swift
//  raspalarm-controller
//
//  Created by Olivier Chevallier on 16.08.20.
//

import SwiftUI

struct DaySelector: View {
    @State private var daysOfWeek = [
        WeekDay(id: 0, label: "Lundi", abreviation: "Lu"),
        WeekDay(id: 1, label: "Mardi", abreviation: "Ma"),
        WeekDay(id: 2, label: "Mercredi", abreviation: "Me"),
        WeekDay(id: 3, label: "Jeudi", abreviation: "Je"),
        WeekDay(id: 4, label: "Vendredi", abreviation: "Ve"),
        WeekDay(id: 5, label: "Samedi", abreviation: "Sa"),
        WeekDay(id: 6, label: "Dimanche", abreviation: "Di")
    ]
    
    var body: some View {
        HStack {
            ForEach(daysOfWeek) { day in
                Button(action: {
                    daysOfWeek[day.id].active.toggle()
                }, label: {
                    Text(day.abreviation)
                })
                .frame(width: 40, height: 40)
                .background(day.active ? Color.orange : Color.black)
                .cornerRadius(100.0)
                .foregroundColor(.white)
            }
        }
    }
}

struct WeekDay: Identifiable {
    var id: Int
    var label: String
    var abreviation: String
    var active: Bool = false
}

struct DaySelector_Previews: PreviewProvider {
    static var previews: some View {
        DaySelector()
            .previewLayout(.fixed(width: 400, height: 90))
    }
}
