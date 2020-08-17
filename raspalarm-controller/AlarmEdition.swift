//
//  AlarmEdition.swift
//  raspalarm-controller
//
//  Created by Olivier Chevallier on 16.08.20.
//

import SwiftUI

struct AlarmEdition: View {
    var alarm: Alarm? = nil
    @State private var time = Date()
    @State private var description = ""
    @State private var uri = ""
    @State var rep = [
        WeekDay(id: 0, abreviation: "Lu"),
        WeekDay(id: 1, abreviation: "Ma"),
        WeekDay(id: 2, abreviation: "Me"),
        WeekDay(id: 3, abreviation: "Je"),
        WeekDay(id: 4, abreviation: "Ve"),
        WeekDay(id: 5, abreviation: "Sa"),
        WeekDay(id: 6, abreviation: "Di")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(height: 50)
                DaySelector(selection: $rep)
                    .frame(height: 50)
                TextField("Description", text: $description).textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 50)
                TextField("Spotify URI", text: $uri).textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 50)
                Spacer()
            }.padding()
            .navigationBarTitle(Text("Alarme"))
            .navigationBarItems(trailing: Button(action: {}){
                Text("Enregistrer")
            })
            .navigationBarTitleDisplayMode(.inline)
        }.onAppear {
            // Faire une peu de nettoyage par ici parce que c'est un peu n'imp
            if(alarm != nil) {
                for i in 0...alarm!.rep.count - 1 {
                    if (alarm!.rep[i]) {
                        rep[i].active = true
                    }
                }
                var dateComponents = DateComponents()
                dateComponents.hour = alarm!.hours
                dateComponents.minute = alarm!.minutes
                let userCalendar = Calendar.current
                self.time = userCalendar.date(from: dateComponents)!
                self.description = alarm!.name
                self.uri = alarm!.uri
            }
        }
    }
}

struct AlarmEdition_Previews: PreviewProvider {
    static var previews: some View {
        AlarmEdition()
    }
}
