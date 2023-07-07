//
//  ScrowView.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 05/06/23.
//

import SwiftUI

struct ScrollViewWithHeader: View{
    
    @EnvironmentObject var plantViewModel: PlantViewModel
    
    
    var body: some View {
        
        @State var filtedPlants = plantViewModel.filterPlant()
        
        VStack(alignment: .leading) {
            Text("Lembretes")
                .font(Font.custom("Satoshi-Bold", size: 28))
                .fontWeight(.bold)
                .padding()
                .foregroundColor(Color("VerdeEscuro"))
                .padding(.leading, 5)
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 12) {
                    
                    ForEach(filtedPlants, id: \.id){ plantas in
                        ReminderCardView(plant: plantas)
                    }
                    //                    ForEach(cards, id: \.id) { cards in
                    //                        cards
                    //                        ForEach(cards, id: \.self) { card in
                    //                            card.listRowInsets(EdgeInsets())
                    
                }
            }
        }
    }
        
}
