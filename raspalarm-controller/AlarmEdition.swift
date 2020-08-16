//
//  AlarmEdition.swift
//  raspalarm-controller
//
//  Created by Olivier Chevallier on 16.08.20.
//

import SwiftUI

struct AlarmEdition: View {
    @State private var time = Date()
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(height: 50)
                DaySelector()
                    .frame(height: 50)
                TextField("Description", text: $description).textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 50)
                TextField("Spotify URI", text: $description).textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(height: 50)
                Spacer()
            }.padding()
            .navigationBarTitle(Text("Alarme"))
            .navigationBarItems(trailing: Button(action: {}){
                Text("Enregistrer")
            })
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AlarmEdition_Previews: PreviewProvider {
    static var previews: some View {
        AlarmEdition()
    }
}
