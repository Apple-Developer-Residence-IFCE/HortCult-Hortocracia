//
//  Home.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 06/06/23.
//

import SwiftUI

struct Home: View {
//    @State var images: [String] = ["Tomatinho","Abobrinha","Tomatinho2","Abobrinha2"]
    @Environment(\.colorScheme) var colorScheme
    
    @EnvironmentObject var plantViewModel: PlantViewModel
    
    var body: some View {
        NavigationView {
            VStack{
                HeaderLogo()
                    .ignoresSafeArea()
                ListaPlantasView()
                    .padding(.top,20)
                ScrollViewWithHeader()
            }
            .offset(y:-47)
        }.navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

