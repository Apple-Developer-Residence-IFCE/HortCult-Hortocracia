//
//  TestarListaPlantasView.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct TestarListaPlantasView: View {

    @State var images: [String] = ["Tomatinho","amico(1)","amico-1(1)","Tomatinho3"]
    var body: some View {
        VStack{
            ListaPlantasView()
        }

    }   
}

struct TestarListaPlantasView_Previews: PreviewProvider {
    static var previews: some View {
        TestarListaPlantasView()
            .environmentObject(PlantViewModel())
    }
}
