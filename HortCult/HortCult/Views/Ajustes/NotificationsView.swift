//
//  NotificationsView.swift
//  HortCult
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct NotificationsView: View {
    
    @AppStorage ("selectedHour") private var selectedHour: String = "00:00"
    let options = ["00:00", "8:00", "12:00", "14:00"]
    @State private var isHourSelectVisible: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            Text("Notificações")
                .font(Font.custom("Satoshi-Regular", size: 16))
                .bold()
            Text("Horário")
                .font(Font.custom("Satoshi-Regular", size: 12))
                .padding(.top, 24)
            HStack{
                Button{
                    isHourSelectVisible.toggle()
                } label:{
                    
                    Text(selectedHour)
                        .font(Font.custom("Satoshi-Regular", size: 16))
                        .padding(.leading, 16)
                        .foregroundColor(Color("Cinza"))
                    Spacer()
                    Image("Relogio")
                        .padding(.trailing, 11)
                    
                }.frame(width: 350, height: 38)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("Cinza"), lineWidth: 1)
                        
                    )
            }
            
            if(isHourSelectVisible){
                VStack{
                    DatePicker("Selecione uma opção",
                               selection: Binding<Date>(
                                get: { dateFormatter.date(from: selectedHour) ?? Date() },
                                set: { selectedHour = stringFromDate($0) }
                               ),
                               displayedComponents: .hourAndMinute
                    ).frame(height: 175)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                    .padding(.leading, 16)
                    .environment(\.locale, Locale(identifier: "pt_BR"))
                    Button{
                        isHourSelectVisible.toggle()
                        NotificationManager.shared.scheduleNotificationConverter(timeString: selectedHour)
                        
                    } label: {
                        Text("Confirmar")
                    }
                }
            }
            
        }
    }
    
    private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter
        }
        
    private func stringFromDate(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }
    
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
