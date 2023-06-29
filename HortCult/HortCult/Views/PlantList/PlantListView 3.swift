//
//  ListaPlantasView.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct ListaPlantasView: View {
    
    @EnvironmentObject var plantViewModel: PlantViewModel
    
    func dataToImage(data: Data) -> Image{
        
        guard let uiImage = UIImage(data: data) else {
            return Image("Tomatinho")
        }
        return Image(uiImage: uiImage)
    }
    
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
    
    var body: some View {
        
        VStack(spacing: 20){
            HStack(spacing: 170.0){
                Text("Minha Horta")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("VerdeEscuro"))
                    .padding(.leading, 5)
                NavigationLink {
                    AddVegetable(plantViewModel: plantViewModel)
                } label: {
                    HStack {
                        Image(selectedTheme == .Escuro ? "Add" : "AddWhite")
                            .frame(width: 32, height: 32)
                            .background(Color("VerdeEscuro"))
                            .cornerRadius(50)
                    }
                }
                
            }
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(plantViewModel.plant, id: \.self) { planta in
                        
                        NavigationLink(destination: InformationView(planta: planta)){
                            VStack{
                                //                                dataToImage(data: planta.image)
                                //                                    .resizable()
                                //                                    .aspectRatio(contentMode: .fill)
                                //                                    .frame(maxHeight: 115)
                                //                                    .clipped()
                                Text(planta.name!)
                                    .font(Font.custom("Satoshi-Regular", size: 16))
                                    .foregroundColor(Color("CinzaEscuro"))
                                    .padding(.bottom, 9)
                            }.frame(width: 140, height: 150)
                                .background(Color("BrancoMinhaHorta"))
                                .cornerRadius(12)
                        }
                    }
                }
            }
            .padding(.leading, 20.0)
            .frame(maxHeight: 150)
        }
    }
    
}

struct ListaPlantasView_Previews: PreviewProvider {
    static var previews: some View {
        ListaPlantasView()
            .environmentObject(PlantViewModel())
    }
}