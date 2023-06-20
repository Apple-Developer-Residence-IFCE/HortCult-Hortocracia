//
//  InformationView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct InformationView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var planta: Plant
       // @ViewBuilder var content: () -> Content
        
        var NavBarInfo : some View {
            ZStack{
                HStack{
                    Button(action:{
                        self.presentationMode.wrappedValue.dismiss()
                    } ) {
                        Image("Arrow-Left-Light")
                        Text("Voltar").foregroundColor(.white)
                    }
                    .padding(.leading, 18)
                    Spacer()
                    
                }.allowsHitTesting(true)
            }
        }
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                ZStack{
                  
                    VStack{
    
                            
                            ImagesListView()
                        .padding(.bottom, 16)
                        
                        DescriptionPlant()
                            .padding(.bottom, 24)
                        
                        CardProxRegaView(dataProxRega: " ")
                            .padding(.bottom, 24)
                        
                        HStack {
                            VStack(alignment: .leading){
                                Text("Frequência de Rega")
                                    .font(.system(size: 16))
                                    .foregroundColor(.black)
                                    .padding(.leading, 20)
                                Text("Todos os Dias")
                                    .font(.system(size: 18))
                                    .foregroundColor(.black)
                                    .bold()
                                    .padding(.leading, 20)
                                    .padding(.top, 4)
                                
                            }
                            Spacer()
                        }
                        NavigationLink {
                            EditVegetable(plant: planta, name: planta.name ?? "", description: planta.information ?? "", categoria: planta.category ?? "", frequencia: planta.frequency ?? "")
                        } label: {
                            HStack {
                                Image("Editar")
                                Text("Editar Informações")
                                    .font(.system(size: 16))
                                    .bold()
                            }
                            .foregroundColor(Color("H1Color"))
                            .padding()
                            .frame(width: 275, height: 42)
                            .background(.white)
                            .cornerRadius(40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("H1Color"), lineWidth: 2)
                            )
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 16)
                        
                        Button(action: {
                            
                        }) {
                            HStack {
                                Image("Remover")
                                Text("Excluir da minha horta")
                                    .font(.system(size: 16))
                                    .bold()
                            }
                            .foregroundColor(.white)
                            
                            .frame(width: 275, height: 42)
                            .background(Color("Vermelho"))
                            .cornerRadius(40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("Vermelho"), lineWidth: 2)
                            )
                        }.padding(.bottom, 50)
                        
                    }
                }
                
            }.ignoresSafeArea(.all)
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBarInfo)
        
    }
    
}
