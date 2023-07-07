//
//  AjustesView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct AjustesView: View {
    
    @AppStorage ("isToggleOn") private var isToggleOn = false
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
    @AppStorage ("selectedHour") private var selectedHour: String = "00:00"
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading){
                HeaderLogo()
                    .ignoresSafeArea()
                Group{
                    HStack{
                        Text("Ajustes")
                            .font(Font.custom("Satoshi-Bold", size: 28))
                            .foregroundColor(Color("VerdeEscuro"))
                            .bold()
                    }
                    HStack{
                        Text("Tema")
                            .font(Font.custom("Satoshi-Regular", size: 18))
                            .foregroundColor(Color("VerdeEscuro"))
                            .bold()
                        Spacer()
                        NavigationLink {
                            ThemeView()
                        } label: {
                            HStack {
                                switch selectedTheme {
                                case .Claro:
                                    Text("Claro")
                                        .font(Font.custom("Satoshi-Regular", size: 16))
                                        .foregroundColor(Color("Preto"))
                                case .Escuro:
                                    Text("Escuro")
                                        .font(Font.custom("Satoshi-Regular", size: 16))
                                        .foregroundColor(Color("Preto"))
                                case .Padrao:
                                    Text("Padrão")
                                        .font(Font.custom("Satoshi-Regular", size: 16))
                                        .foregroundColor(Color("Preto"))
                                case .none:
                                    Text("Padrão")
                                        .font(Font.custom("Satoshi-Regular", size: 16))
                                        .foregroundColor(Color("Preto"))
                                }
                                
                                Image(selectedTheme == .Escuro ? "DropdownLight" : "Dropdown")
                                    .rotationEffect(Angle(degrees: -90))
                                
                            }
                        }
                    }.padding(.top, 53)
                        .padding(.bottom, 31)
                    
                    Divider()
                }.padding(.horizontal, 20)
                    
                Group{
                    HStack{
                        Text("Notificações Push")
                            .font(Font.custom("Satoshi-Regular", size: 18))
                            .foregroundColor(Color("VerdeEscuro"))
                            .bold()
                        Spacer()
                        Toggle("", isOn: $isToggleOn)
                    }.padding(.top, 24)
                    .padding(.bottom, 31)
                    
                    Divider()
                        .padding(.bottom, 16)
                        .onChange(of: isToggleOn) {
                            newValue in
                            
                            NotificationManager.shared.cancelScheduledNotification()
                            
                        }
                    if(isToggleOn){
                        NotificationsView()
                    }
                }.padding(.horizontal, 20)
                    
                Spacer()
                    
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)

        
        
    }
    
}

struct AjustesView_Previews: PreviewProvider {
    static var previews: some View {
        AjustesView()
    }
}
