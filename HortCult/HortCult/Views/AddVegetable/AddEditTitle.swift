//
//  AddEditTitle.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 14/06/23.
//

import SwiftUI

struct AddEditTitle: View {
    
    var addEdit:Bool
    
    var body: some View {
        if addEdit {
            HStack{
                Text("Adicionar Vegetal")
                    .font(.title)
                    .font(Font.custom("Satoshi-Bold", size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(Color("VerdeEscuro"))
                    .padding(.top, 20)
                Spacer()
            }.padding()
        } else {
            HStack{
                Text("Editar Vegetal")
                    .font(.title)
                    .font(Font.custom("Satoshi-Bold", size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(Color("VerdeEscuro"))
                    .padding(.top, 20)
                Spacer()
            }.padding()
        }
    }
}

struct AddEditTitle_Previews: PreviewProvider {
    static var previews: some View {
        AddEditTitle(addEdit: true)
    }
}
