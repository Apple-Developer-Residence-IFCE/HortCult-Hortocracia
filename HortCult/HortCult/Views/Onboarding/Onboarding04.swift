//
//  Onboarding04.swift
//  HortCult
//
//  Created by userext on 26/05/23.
//

import SwiftUI

struct Onboarding04: View {
    @State private var showOnboarding = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            VStack{
                HortCultLogo()
                ImageSelectorView(ImageTrue: true, MainImage: "onboarding04")
                TittleSelector(sizeSelector: true, textSelector: "Hora de Cuidar")
                Description(descriptionText: "Receba lembretes para regar e adubar suas lantas na frequência certa.")
                VStack{
                    NavigationLink(destination: TabBar(plantViewModel: PlantViewModel()), isActive: $showOnboarding) {
                        EmptyView()
                    }
                    Button(action: {
                        showOnboarding = true
                        HortCultApp.isFirstLogin = false
                    }) {
                        HStack {
                            Text("Ir para a Tela Inicial")
                                .font(Font.custom("Satoshi-Regular", size: 16))
                            Image(colorScheme == .dark ? "Arrow-Right" : "Arrow-Right-White")
                                .foregroundColor(Color("Branco"))
                        }
                        .foregroundColor(Color("Branco"))
                        .padding()
                        .frame(width: 277, height: 42)
                        .background(Color("VerdeEscuro"))
                        .cornerRadius(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color("VerdeEscuro"), lineWidth: 2)
                        )
                    }
                }
                SecondButton(appearButton: false)
            }.navigationBarBackButtonHidden(true)
        }.navigationBarBackButtonHidden(true)
    }
}

struct Onboarding04_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding04()
    }
}
