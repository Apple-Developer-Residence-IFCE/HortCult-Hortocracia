//
//  ThemeView.swift
//  HortCult
//
//  Created by Victor Viana on 12/06/23.
//
import SwiftUI

enum Choice: String {
    case Claro
    case Escuro
    case Padrao
}

struct ThemeView: View {
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var NavBar : some View {
        
        HStack {
            Button(action:{
                presentationMode.wrappedValue.dismiss()
            } ) {
                Image("Arrow-Left-Green")
                    .frame(width: 24, height: 24)
                Text("Ajustes")
                    .font(Font.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("VerdeEscuro"))
            }.padding(.leading, 5)
            Spacer()
                
        }
        
    }
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                
                Text("Tema")
                    .font(Font.custom("Satoshi-Bold", size: 28))
                    .foregroundColor(Color("VerdeEscuro"))
                    .padding(.bottom, 40)
                    .padding(.top, 37)
                    .padding(.leading, 24)
                
                HStack{
                    Button(action: {
                        selectedTheme = .Claro
                    }) {
                        Circle()
                            .foregroundColor(circleColor(for: .Claro))
                            .frame(width: 10, height: 10)
                            .padding(5)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }.padding(.leading, 24)
                    Text("Claro")
                        .font(Font.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(Color("CinzaEscuro"))
                    Spacer()
                }.padding(.bottom, 15)
                
                HStack{
                    Button(action: {
                        selectedTheme = .Escuro
                    }) {
                        Circle()
                            .foregroundColor(circleColor(for: .Escuro))
                            .frame(width: 10, height: 10)
                            .padding(5)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }.padding(.leading, 24)
                    Text("Escuro")
                        .font(Font.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(Color("CinzaEscuro"))
                }.padding(.bottom, 15)
                
                HStack{
                    Button(action: {
                        selectedTheme = .Padrao
                    }) {
                        Circle()
                            .foregroundColor(circleColor(for: .Padrao))
                            .frame(width: 10, height: 10)
                            .padding(5)
                            .overlay(
                                Circle()
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }.padding(.leading, 24)
                    Text("Padrão do sistema")
                        .font(Font.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(Color("CinzaEscuro"))
                }
                Spacer()
            }
        }.preferredColorScheme(selectedTheme == .Claro ? .light : (selectedTheme == .Escuro ? .dark : .none))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBar)
        .edgesIgnoringSafeArea(.all)

    }
    
    private func circleColor(for choice: Choice) -> Color {
        if selectedTheme == choice {
            return Color("VerdeEscuro")
        } else {
            return Color("")
        }
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView()
    }
}
