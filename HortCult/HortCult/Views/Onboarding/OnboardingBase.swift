//
//  OnboardingScreen.swift
//  HortCult-PotatosHead
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct OnboardingScreen: View {
    
    //Tela
    
    var header: String
    var centerImage: String?
    var primaryText: String
    var secondaryText: String
    
    //Primeiro botao
    
    var actionMainButton: (() -> Void)
    var mainButtonType: buttonCases
    
    //Segundo botao
    
    var hidenSecondaryButton: Bool
    var actionSecondaryButton: (() -> Void)?
    
    var body: some View {
        
        VStack {
            
            Image(header)
                .padding(.top, 20)
                .padding(.horizontal, 108)
            
            if let cImage = centerImage {
                Image(cImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.horizontal, 57)
                    .padding(.top, 39.62)
                    .padding(.bottom, 34.24)
                
                Text(primaryText)
                    .foregroundColor(Color("VerdeEscuro"))
                    .padding(.bottom, 12)
                    .padding(.horizontal)
                    .font(.custom("Satoshi-Medium", size: 24))
                    .multilineTextAlignment(.center)
                
                Text(secondaryText)
                    .padding(.horizontal, 47)
                    .padding(.bottom, 80)
                    .multilineTextAlignment(.center)
                    .font(.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("Cinza"))
                    .layoutPriority(1.0)
                
                ReusableButton(buttonTipe: mainButtonType , action: {actionMainButton()})
                        .padding(.bottom, 25)
                
                    Button("Pular para a tela inicial") {
                        if let secondButtonAction = actionSecondaryButton {
                            secondButtonAction()
                        } else {
                            return
                        }
                        
                    }.padding(.bottom, 64)
                        .foregroundColor(Color("CorTextoBotaoPrincipal"))
                        .font(.custom("Satoshi-Medium", size: 16))
                        .opacity(hidenSecondaryButton ? 0 : 1)
                        .disabled(hidenSecondaryButton ? true : false)
                
            } else {
                
                Spacer()
                
                Text(primaryText)
                    .foregroundColor(Color("VerdeEscuro"))
                    .padding(.bottom, 12)
                    .padding(.horizontal)
                    .font(.custom("Satoshi-Bold", size: 28))
                    .multilineTextAlignment(.center)
                
                Text(secondaryText)
                    .padding(.horizontal, 47)
                    .padding(.bottom, 211)
                    .multilineTextAlignment(.center)
                    .font(.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("Cinza"))
                
                ReusableButton(buttonTipe: mainButtonType , action: {actionMainButton()})
                    .padding(.bottom, 25)
                
                Button("Pular para a tela inicial") {
                    if let secondButtonAction = actionSecondaryButton {
                        secondButtonAction()
                    } else {
                        return
                    }
                    
                }.padding(.bottom, 64)
                    .foregroundColor(Color("Cinza"))
                    .font(.custom("Satoshi-Medium", size: 16))
                    .opacity(hidenSecondaryButton ? 0 : 1)
                    .disabled(hidenSecondaryButton ? true : false)
                    
            }
        }
    }
}





struct OnboardingSkull_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen(header:"Logo_Clara",
                         primaryText: "Boas vindas!",
                         secondaryText: "Com o HortCult, você pode acompanhar a sua horta doméstica de forma simples e fácil",
                         actionMainButton: {print("ola")},
                         mainButtonType: .one,
                         hidenSecondaryButton: true)
    }
}
