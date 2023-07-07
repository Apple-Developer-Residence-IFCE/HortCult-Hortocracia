//
//  CardProxRegaView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct CardProxRegaView: View {
    var imagem: String = "WaterBlue"
    @State var dataProxRega: String
    @EnvironmentObject var plantViewModel: PlantViewModel
    @State var plant: Plant
    var body: some View {
        var auxFrequency: Int = 0
        HStack(spacing: 16){
            Image(imagem)
                .frame(width: 52, height: 52)
                .background(Color("Azul").opacity(0.1))
                .cornerRadius(60)
                .padding(.leading, 20)
            
            VStack(alignment: .leading){
                
                Text("Próxima rega:")
                    .font(Font.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("CinzaEscuro"))
                
                Text(dataProxRega)
                    .font(Font.custom("Satoshi-Regular", size: 18))
                    .foregroundColor(Color("Preto"))
                
                Button{
                    
                    if (plant.frequency == "Todos os dias"){
                        auxFrequency = 1
                    }else if(plant.frequency == "A cada 2 dias"){
                        auxFrequency = 2
                    }else if(plant.frequency == "A cada 4 dias"){
                        auxFrequency = 4
                    }else{
                        auxFrequency = 7
                    }
                    let formatter = DateFormatter()
                    formatter.dateFormat = "dd/MM/yyyy"
                    var nextDate: Date = Date()
                    nextDate = formatter.date(from: String(nextDate.formatted().prefix(10))) ?? Date()
                    nextDate = Calendar.current.date(byAdding: .day, value: auxFrequency, to: nextDate)!
                    plantViewModel.updatePlant(plant: plant, name: plant.name ?? "", information: plant.information ?? "", category: plant.category ?? "", frequency: plant.frequency ?? "", nextDate: nextDate, image: plantViewModel.dataImageConvert(datas: plant.image ?? []))
                    plant = plantViewModel.getPlantId(id: plant.id!)!
                    dataProxRega = String(nextDate.formatted().prefix(10))
                } label: {
                    Text("Marcar como regado")
                        .font(Font.custom("Satoshi-Regular", size: 12))
                        .foregroundColor(Color("Cinza"))
                }.frame(width: 131, height: 28)
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color("Cinza"), lineWidth: 1)
                )

            }
            Spacer()
        }.frame(width: 350, height: 118)
            .background(Color("Azul").opacity(0.2))
            .cornerRadius(12)
            
    }
}

//struct CardProxRegaView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardProxRegaView(dataProxRega: "", plant: )
//    }
//}
