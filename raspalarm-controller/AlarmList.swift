//
//  AlarmList.swift
//  raspalarm-controller
//
//  Created by Olivier Chevallier on 16.08.20.
//

import SwiftUI

struct AlarmList: View {
    @State var edition = false
    @State private var showNewAlarm = false
    @State private var showEditAlarm = Array(repeating: false, count: sampleAlarms.count)
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(sampleAlarms, id: \.id) { alarm in
                    let index = sampleAlarms.firstIndex(of: alarm)
                    AlarmRow(alarm: alarm, active: alarm.active, edition: $edition)
                        .onTapGesture(count: 1, perform: {
                            showEditAlarm[index!] = true && edition
                        })
                        .sheet(isPresented: $showEditAlarm[index!], content: {
                            AlarmEdition(alarm: alarm)
                        })
                }
            }
            .navigationBarTitle(Text("Alarmes"))
            .navigationBarItems(leading:  Button(edition ? "Annuler" : "Modifier") {edition.toggle()}, trailing: Button(action: {
                showNewAlarm = true
            }){
                    Image(systemName: "plus")
            }.sheet(isPresented: $showNewAlarm, content: {
                AlarmEdition()
            }))
        }
    }
}

struct AlarmList_Previews: PreviewProvider {
    static var previews: some View {
        AlarmList()
    }
}
