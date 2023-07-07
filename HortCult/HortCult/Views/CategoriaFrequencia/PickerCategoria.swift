//
//  PickersAdcView.swift
//  HortCult
//
//  Created by Yohanne Moreira on 13/06/23.
//

import SwiftUI

enum select: String, CaseIterable {
    case hortalicas = "Hortaliças"
    case legumes = "Legumes"
    case pimentas = "Pimentas"
    case medicinais = "Medicinais"
    case temperos = "Temperos"
}

struct PickerCategoria: View {
    @State private var isPickerExpanded: Bool = false
    @State private var ButtonHidden: Bool = false
    @Binding var selectedOption: String
    
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
                        
                        
                        ForEach(select.allCases, id: \.self){
                            option in  Button(action:{
                                selectedOption = option.rawValue
                                isPickerExpanded.toggle()
                                ButtonHidden.toggle()
                                
                            }){
                                
                                VStack(alignment: .leading){
                                    if (option == select.hortalicas){
                                        HStack{
                                            Text(selectedOption)
                                                .font(Font.custom("Satoshi-Regular", size: 16))
                                                .padding(.leading, 16)
                                                .foregroundColor(Color("CinzaClaro"))
                                            Spacer()
                                            Image("Arrow-Top")
                                                .padding(.trailing, 22)
                                        }
                                        .padding(.bottom, 18)
                                    }
                                    if(option.rawValue != selectedOption){
                                        Text(option.rawValue)
                                            .font(Font.custom("Satoshi-Regular", size: 16))
                                            .foregroundColor(Color("Cinza"))
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

struct PickersPickerCategoria_Previews: PreviewProvider {
    static var previews: some View {
        Teste2()
    }
}
struct Teste2: View {
    @State var categoria: String = "Hortaliça"
  
    
    var body: some View {
        PickerCategoria(selectedOption: $categoria)
        
    }
}

