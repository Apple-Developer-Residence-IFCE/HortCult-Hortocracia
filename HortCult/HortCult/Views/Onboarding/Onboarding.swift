//
//  Onboarding.swift
//  HortCult
//
//  Created by Gabriel Carvalho on 30/06/23.
//

import SwiftUI

struct Onboarding: View {
    
    @State var selectedTab = 0
    @Binding var showOnboarding: Bool
    
    
    var body: some View {
        
        
        TabView(selection: $selectedTab) {
            
            OnboardingScreen(header:"Logo_Clara",
                             primaryText: "Boas vindas!",
                             secondaryText: "Com o HortCult, você pode acompanhar a sua horta doméstica de forma simples e fácil",
                             actionMainButton: {goToNext()},
                             mainButtonType: .one,
                             hidenSecondaryButton: true)
            .tag(0)
            
            OnboardingScreen(header: "Logo_Clara",
                             centerImage: "ImagensHort",
                             primaryText: "Acompanhe a sua horta",
                             secondaryText: "Tenha uma visão geral do desenvolvimento das duas plantações",
                             actionMainButton: {goToNext()},
                             mainButtonType: .two,
                             hidenSecondaryButton: false,
                             actionSecondaryButton: {showOnboarding = false})
            .tag(1)
            
            OnboardingScreen(header: "Logo_Clara",
                             centerImage: "onboarding03",
                             primaryText: "Amplie sua horta com diferentes vegetais",
                             secondaryText: "Adicione fotos e informações como luminosidade, umidade e muito mais.",
                             actionMainButton: {goToNext()}, mainButtonType: .two,
                             hidenSecondaryButton: false,
                             actionSecondaryButton: {showOnboarding = false})
            .tag(2)
            
            OnboardingScreen(header: "Logo_Clara",
                             centerImage: "onboarding04",
                             primaryText: "Hora de Cuidar",
                             secondaryText: "Receba lembretes para regar e adubar suas plantas na frequência certa.",
                             actionMainButton: {
                                goToNext()
                            },
                             mainButtonType: .three,
                             hidenSecondaryButton: true)
            .tag(3)
            
        }.tabViewStyle(.page(indexDisplayMode: .never))
        
        
        
    }
    private func goToNext(){
        withAnimation {
            if selectedTab < 3 {
                selectedTab += 1
                
            } else {
                showOnboarding = false
            }
        }
    }
}



struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding(showOnboarding: .constant(true))
    }
}
