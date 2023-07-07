//
//  ButtonView.swift
//  testeComponentes
//
//  Created by userext on 24/05/23.
//

import SwiftUI

enum buttonCases: CaseIterable {
    
    case one
    case two
    case three
    
}

struct ReusableButton: View {
    var buttonTipe: buttonCases
    var action: (() -> Void)
    var body: some View {
        
        Button(action: {
            action()
        }) {
            switch buttonTipe {
            case .one:
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 277, height: 42)
                        .foregroundColor(Color("VerdeEscuro"))
                    Text("Iniciar")
                        .font(.custom("Satoshi-Bold", size: 16))
                        .foregroundColor(Color("Branco"))
                }
            case .two:
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color("VerdeEscuro"), lineWidth: 1)
                        .frame(width: 277, height: 42)
                    
                    HStack{
                        Text("Continuar")
                            .font(.custom("Satoshi-Bold", size: 16))
                            .foregroundColor(Color("VerdeEscuro"))
                        Image("Arrow-Right")
                            .renderingMode(.template)
                            .foregroundColor(Color("VerdeEscuro"))
                    }
                }
            case .three:
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 277, height: 42)
                        .foregroundColor(Color("VerdeEscuro"))
                    
                    HStack {
                        Text("Ir para a Tela Inicial")
                            .font(.system(size: 16))
                            .foregroundColor(Color("Branco"))
                        
                        Image("Arrow-Right")
                            .renderingMode(.template)
                            .foregroundColor(Color("Branco"))
                    }
                }
            }
        }
    }
    
    
    
    
    struct ButtonView_Previews: PreviewProvider {
        static var previews: some View {
            ReusableButton(buttonTipe: .three, action: {print("a")})
        }
    }
}
