//
//  PickerFrequencia.swift
//  HortCult
//
//  Created by Yohanne Moreira on 15/06/23.
//

import SwiftUI
enum options: String, CaseIterable {
    case diario = "Todos os dias"
    case dois = "A cada 2 dias"
    case quatro = "A cada 4 dias"
    case semana = "1 vez por semana"
}

struct PickerFrequencia: View {
    @State private var selectedOption: String = "Selecionar..."
    @State private var isPickerExpanded: Bool = false
    @State private var ButtonHidden: Bool = false
    private var auxiliar: Int = 1
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Categoria")
                    .font(Font.custom("Satoshi-Regular", size: 12))
                    .padding(.leading, 20)
                
                if (!ButtonHidden){
                    Button{
                        ButtonHidden.toggle()
                        isPickerExpanded.toggle()
                        
                    } label: {
                        Text(selectedOption)
                            .font(Font.custom("Satoshi-Regular", size: 16))
                            .padding(.leading, 16)
                            .foregroundColor(Color("Cinza"))
                        Spacer()
                        Image("Arrow-Bottom")
                            .padding(.trailing, 22)
                        
                    }.frame(width: 350, height: 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color("CinzaClaro"), lineWidth: 1)
                            
                        )
                        .padding(.leading, 20)
                }
                
                
                if (isPickerExpanded){
                    VStack(alignment: .center){
                        
                        
                        ForEach(options.allCases, id: \.self){
                            option in  Button(action:{
                                selectedOption = option.rawValue
                                isPickerExpanded.toggle()
                                ButtonHidden.toggle()
                                
                            }){
                                
                                VStack(alignment: .leading){
                                    if (option == options.diario){
                                        HStack{
                                            Text(selectedOption)
                                                .font(Font.custom("Satoshi-Regular", size: 16))
                                                .padding(.leading, 16)
                                                .foregroundColor(Color("Cinza"))
                                            Spacer()
                                            Image("Arrow-Top")
                                                .padding(.trailing, 22)
                                        }
                                        .padding(.bottom, 18)
                                    }
                                    if(option.rawValue != selectedOption){
                                        Text(option.rawValue)
                                            .font(Font.custom("Satoshi-Regular", size: 16))
                                            .foregroundColor(Color("Cinzaclaro"))
                                            .padding(.bottom, 18)
                                            .padding(.leading, 20)
                                    }
                                }
                                
                                Spacer()
                            }
                        }
                    } .frame(width: 350)
                        .padding(.top, 9)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("Cinza"), lineWidth: 1)
                            
                            
                            
                        )
                        .padding(.leading, 20)
                }
                
            }
            Spacer()
            
            
        }
    }
}

struct PickerFrequencia_Previews: PreviewProvider {
    static var previews: some View {
        PickerFrequencia()
    }
}
