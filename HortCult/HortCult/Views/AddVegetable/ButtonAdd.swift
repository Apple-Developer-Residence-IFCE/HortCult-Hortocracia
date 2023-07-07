//
//  ButtonAdd.swift
//  HortCult
//
//  Created by Yohanne Moreira on 15/06/23.
//

import SwiftUI

struct ButtonAdd: View {
    var body: some View {
        Button(action: {
            
        }) {
            HStack {
                Text("Adicionar Novo Vegetal")
                    .font(Font.custom("Satoshi-Regular", size: 16))
                    .bold()
            }
            .foregroundColor(.white)
            
            .frame(width: 350, height: 42)
            .background(Color("VerdeEscuro"))
            .cornerRadius(40)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color("VerdeEscuro"), lineWidth: 2)
            )
        } //.padding(.bottom, 50)
        .background(Color.clear)
    }
}

struct ButtonAdd_Previews: PreviewProvider {
    static var previews: some View {
        ButtonAdd()
    }
}
