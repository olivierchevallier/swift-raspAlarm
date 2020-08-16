//
//  AlarmRow.swift
//  raspalarm-controller
//
//  Created by Olivier Chevallier on 16.08.20.
//

import SwiftUI

struct AlarmRow: View {
    var alarm: Alarm
    @State var active: Bool = true
    @Binding var edition: Bool
    @State private var showingAlert = false
    
    var body: some View {
        HStack {
            VStack {
                HStack {
                    if (edition) {
                        Button(action: {
                            showingAlert = true
                        }, label: {
                            Image(systemName: "minus.circle.fill")
                                .foregroundColor(.red)
                        })
                        .padding()
                        //Comprendre pourquoi la transition ne fonctionne pas
                        .transition(.slide)
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Attention vous êtes sur le point de supprimer l'alarme"), primaryButton: .destructive(Text("Supprimer")), secondaryButton: .cancel(Text("Annuler")))
                        }
                    }
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
                    if(!edition) {
                        Toggle("", isOn: $active)
                            .labelsHidden()
                    } else {
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(.horizontal)
                Divider()
            }
        }
    }
}

struct AlarmRow_Previews: PreviewProvider {
    @State static var edition = false
    
    static var previews: some View {
        AlarmRow(alarm: sampleAlarms[1], edition: $edition)
            .previewLayout(.fixed(width: 400, height: 90))
        
        AlarmRow(alarm: sampleAlarms[0], edition: $edition)
            .previewLayout(.fixed(width: 400, height: 90))
        
        AlarmRow(alarm: sampleAlarms[3], edition: $edition)
            .previewLayout(.fixed(width: 400, height: 90))
    }
}
