//
//  InformationView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI



struct InformationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var deleteVegetableAlert = false
    @State private var confirmDeleteVegetableAlert = false
    @State private var backHomeAlert = false
    
    @EnvironmentObject var plantViewModel: PlantViewModel
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
        
    @ViewBuilder var Name: some View {
        if let name = planta.name{
            Text(name)
                .bold()
                .foregroundColor(Color("VerdeEscuro"))
                .font(.custom("Satoshi-Bold", size: 28))
        } else {
            Text("Sem nome!")
        }
            
    }
    @ViewBuilder var Categoria: some View {
        if let category = planta.category{
            Text(category)
                .padding(.horizontal, 13)
                .padding(.vertical, 8)
                .foregroundColor(Color("Cinza"))
                .font(.custom("Satoshi-Regular", size: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color(.gray), lineWidth: 1)
                )
        } else {
            Text("Sem categoria!")
        }
    }
    @ViewBuilder var Information: some View {
        if let information = planta.information{
            Text(information)
                .font(.custom("Satoshi-Regular", size: 16))
                .lineLimit(5)
        } else {
            Text("Sem informações!")
        }
    }
    
//    @State var images: [UIImage]
//    @State var description: String
//    @State var img: String
//    @State var data: String
    
    @State var planta: Plant
        
        var NavBarInfo : some View {
            ZStack{
                HStack{
                    Button(action:{
                        self.presentationMode.wrappedValue.dismiss()
                    } ) {
                        Image("Arrow-Left-Light")
                        Text("Voltar")
                            .font(Font.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(.white)
                    }
                    .padding(.leading, 18)
                    Spacer()
                    
                }.allowsHitTesting(true)
            }
        }
    
    
    func formatDate(date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            return formatter.string(from: date)
    }
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical){
                ZStack{
                    VStack(){
//                        ImagesListView(images: plantViewModel.dataImageConvert(datas: planta.image ?? []))
                        Image(uiImage: UIImage())
                            .frame(minWidth: 390, minHeight: 390)
                            .ignoresSafeArea()
                            .edgesIgnoringSafeArea(.all)
                            .padding(.bottom, 16)
                        VStack(alignment: .leading){
                            HStack{
                                Name
                                Spacer()
                                Categoria
                            }
                            .padding(.bottom,12)
                            Information
                                .padding(.bottom,18)
                        }
                        .padding(.horizontal,20)
                        
                        CardProxRegaView(dataProxRega: formatDate(date: planta.nextDate ?? Date()), plant: planta)
                            .padding(.bottom, 24)
                        
                        HStack {
                            VStack(alignment: .leading){
                                Text("Frequência de Rega")
                                    .font(Font.custom("Satoshi-Regular", size: 16))
                                Text(planta.frequency!)
                                    .font(Font.custom("Satoshi-Bold", size: 18))
                                    .bold()
                                
                            }
                            .foregroundColor(Color("TextOnInfo"))
                            Spacer()
                        }
                        .padding(.horizontal,20)
                        NavigationLink {
                            EditVegetable(plant: planta)
                        } label: {
                            HStack {
                                Image(selectedTheme == .Escuro ? "EditarGreenDark" : "EditarGreen")
                                Text("Editar Informações")
                                    .font(Font.custom("Satoshi-Regular", size: 16))
                                    .bold()
                            }
                            .foregroundColor(Color("VerdeEscuro"))
                            .padding()
                            .frame(width: 275, height: 42)
                            .background(Color("Branco"))
                            .cornerRadius(40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("VerdeEscuro"), lineWidth: 2)
                            )
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 16)
                        
                        Button(action: {
                            deleteVegetableAlert = true
                        }) {
                            HStack {
                                Image("Remover")
                                Text("Excluir da minha horta")
                                    .font(Font.custom("Satoshi-Regular", size: 16))
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
                    if confirmDeleteVegetableAlert {
                        VStack {
                            CustomAlert(
                                title: "Planta Excluida!",
                                message: "",
                                primaryButtonTitle: "Voltar para Tela Inicial",
                                primaryButtonAction: {
                                    backHomeAlert = true
                                }
                            ).padding(.top, 180)

                        }.frame(width: 300, height: 100)
                        NavigationLink(destination: Home()
                            .environmentObject(plantViewModel)
                                       , isActive: $backHomeAlert){
                            EmptyView()
                        }

                    }

                }                
            }.padding(.bottom, 80)
            .ignoresSafeArea(.all)
            
        }
        .alert(isPresented: $deleteVegetableAlert) {
            Alert(
                title: Text("Deseja excluir essa planta? "),
                message: Text("Essa ação não poderá ser desfeita."),
                primaryButton: .cancel(Text(" Cancelar")){},
                secondaryButton:
                        .default(Text("Excluir")) {
                    deleteVegetableAlert = false
                    confirmDeleteVegetableAlert = true
                            plantViewModel.deletePlant(plant: planta)
                }
            )
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBarInfo)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}
