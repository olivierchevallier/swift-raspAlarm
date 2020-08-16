//
//  AlarmList.swift
//  raspalarm-controller
//
//  Created by Olivier Chevallier on 16.08.20.
//

import SwiftUI

struct AlarmList: View {
    @State var edition = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(sampleAlarms, id: \.id) { alarm in
                    AlarmRow(alarm: alarm, active: alarm.active, edition: $edition)
                }
            }
            .navigationBarTitle(Text("Alarmes"))
            .navigationBarItems(leading:  Button(edition ? "Annuler" : "Modifier") {edition.toggle()}, trailing: Button(action: {}){
                Image(systemName: "plus")
            })
        }
    }
}

struct AlarmList_Previews: PreviewProvider {
    static var previews: some View {
        AlarmList()
    }
}
