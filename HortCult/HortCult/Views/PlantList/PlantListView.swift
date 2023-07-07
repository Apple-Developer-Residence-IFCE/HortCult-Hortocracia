//
//  ListaPlantasView.swift
//  HortCult
//
//  Created by userext on 25/05/23.
//

import SwiftUI

struct ListaPlantasView: View {
    
    @EnvironmentObject var plantViewModel: PlantViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack(spacing: 20){
            HStack{
                Text("Minha Horta")
                    .font(Font.custom("Satoshi-Bold", size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(Color("VerdeEscuro"))
                    .padding(.leading, 5)
                Spacer()
                NavigationLink {
                    AddVegetable(plantViewModel: plantViewModel)
                } label: {
                    HStack {
                        Image(colorScheme == .dark ? "Add" : "AddWhite")
                            .frame(width: 32, height: 32)
                            .background(Color("VerdeEscuro"))
                            .cornerRadius(50)
                    }
                }
                
            }.padding(.horizontal, 20)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 12) {
                    ForEach(plantViewModel.plant, id: \.self) { planta in
                        
                        NavigationLink(destination: InformationView(planta: planta)){
                            VStack{
                                
                                Image(uiImage: plantViewModel.dataImageConvert(datas: planta.image ?? []).first ?? UIImage())
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(maxHeight: 115)
                                    .clipped()
                                
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
            .padding(.leading, 20)
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
