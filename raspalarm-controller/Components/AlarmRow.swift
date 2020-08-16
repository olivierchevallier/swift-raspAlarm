//
//  AlarmRow.swift
//  raspalarm-controller
//
//  Created by Olivier Chevallier on 16.08.20.
//

import SwiftUI

struct AlarmRow: View {
    var alarm: Alarm
    @State private var active = true
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text(alarm.getFormatedTime())
                        .font(.largeTitle)
                    Spacer()
                }
                HStack {
                    Text(alarm.name + ", " + alarm.getStringRep())
                        .font(.footnote)
                    Spacer()
                }
            }
            Toggle("", isOn: $active)
                .labelsHidden()
        }
        .padding()
    }
}

struct AlarmRow_Previews: PreviewProvider {
    static var previews: some View {
        AlarmRow(alarm: sampleAlarms[1])
            .previewLayout(.fixed(width: 400, height: 90))
        
        AlarmRow(alarm: sampleAlarms[0])
            .previewLayout(.fixed(width: 400, height: 90))
        
        AlarmRow(alarm: sampleAlarms[3])
            .previewLayout(.fixed(width: 400, height: 90))
    }
}
