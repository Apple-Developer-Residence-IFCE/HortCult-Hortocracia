//
//  NameDescription.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 13/06/23.
//

import SwiftUI

struct NameDescription: View {
    
    @Binding var nameVegetable: String 
    @Binding var descriptionVegetable: String
    @State private var isEditingName: Bool = false
    @State private var isEditingDescription: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Nome")
                .foregroundColor(Color("CinzaEscuro"))
                .fontWeight(.light)
                .font(Font.custom("Satoshi-Regular", size: 12))
            ZStack(alignment: .topLeading) {
                TextEditor(text: $nameVegetable)
                    .padding(.leading, 15)
                    .frame(height: 40)
                    .font(Font.custom("Satoshi-Regular", size: 16))
                    .textCase(.lowercase)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color("CinzaClaro"), lineWidth: 1)
                    )
                    .onTapGesture {
                        isEditingName = true
                    }
                if nameVegetable.isEmpty && !isEditingName {
                    Text("Insira um nome")
                        .font(Font.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(Color("CinzaClaro"))
                        .padding(.leading, 15)
                        .padding(.top, 8)
                }
            }
            Spacer().frame(height: 28)
            Text("Descrição")
                .foregroundColor(Color("CinzaEscuro"))
                .fontWeight(.light)
                .font(Font.custom("Satoshi-Regular", size: 12))
            ZStack(alignment: .topLeading) {
                TextEditor(text: $descriptionVegetable)
                    .padding(.leading, 15)
                    .frame(height: 200)
                    .font(Font.custom("Satoshi-Regular", size: 16))
                    .textCase(.lowercase)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("CinzaClaro"), lineWidth: 1)
                    )
                    .onTapGesture {
                        isEditingDescription = true
                    }
                if descriptionVegetable.isEmpty && !isEditingDescription {
                    Text("Insira uma descrição")
                        .font(Font.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(Color("CinzaClaro"))
                        .padding(.leading, 15)
                        .padding(.top, 8)
                }
            }
        }
        .padding()
    }
}

struct NameDescription_Previews: PreviewProvider {
    static var previews: some View {
        Teste()
    }
}

struct Teste: View {
    @State var name: String = "Teste"
    @State var description: String = "Exemplo"
    
    var body: some View {
        NameDescription(nameVegetable: $name, descriptionVegetable: $description)
        
    }
}

