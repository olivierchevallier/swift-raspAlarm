//
//  DaySelector.swift
//  raspalarm-controller
//
//  Created by Olivier Chevallier on 16.08.20.
//

import SwiftUI

struct DaySelector: View {
    @Binding var selection: [WeekDay]
    
    var body: some View {
        HStack {
            ForEach(selection) { day in
                Button(action: {
                    selection[day.id].active.toggle()
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

/*
struct DaySelector_Previews: PreviewProvider {
    @State var rep = [
        WeekDay(id: 0, abreviation: "Lu"),
        WeekDay(id: 1, abreviation: "Ma"),
        WeekDay(id: 2, abreviation: "Me"),
        WeekDay(id: 3, abreviation: "Je"),
        WeekDay(id: 4, abreviation: "Ve"),
        WeekDay(id: 5, abreviation: "Sa"),
        WeekDay(id: 6, abreviation: "Di")
    ]
    
    static var previews: some View {
        DaySelector(selection: rep)
            .previewLayout(.fixed(width: 400, height: 90))
    }
}
*/
