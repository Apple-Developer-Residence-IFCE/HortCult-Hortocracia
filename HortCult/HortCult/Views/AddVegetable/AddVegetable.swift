//
//  AddVegetable.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 06/06/23.
//

import SwiftUI


struct AddVegetable: View {
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
    var plantViewModel: PlantViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewmodel: AddVegetableViewModel = AddVegetableViewModel()
    @StateObject private var imagesSelected = ImageSelected()
    @State var discartVegetableAlert = false
    //@  var showOverlay = false
    @State var addVegetableAlert = false
    @State var isFullScreenCovering: Bool = false
    @State var isOverlayShown = false
    
    var NavBar : some View {
        ZStack {
            HeaderLogo()
                .frame(minWidth: 400, minHeight: 200)
                .padding(.top,-40)
            HStack {
                Button(action: {
                    if isFieldsAllFilled {
                        discartVegetableAlert = true
                    } else {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                } ) {
                    Image(selectedTheme == .Escuro ? "Arrow-Left-Light" : "Arrow-Left-Green")
                }
                .padding(.leading, 18)
            }
            .padding(.leading,-190)
        }
    }
    
    var isFieldsFilled: Bool{
        return !viewmodel.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !viewmodel.description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && viewmodel.categoria != "Selecionar..." && viewmodel.frequencia != "Selecionar..."
    }
    var isFieldsAllFilled: Bool {
        return !viewmodel.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || !viewmodel.description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || viewmodel.categoria != "Selecionar..." || viewmodel.frequencia != "Selecionar..."
    }
    
    var body: some View {
        
        NavigationView {
            ZStack{
                
                ScrollView(.vertical){
                    
                    ZStack{
                        
                        VStack{
                            AddEditTitle(addEdit: true)
                            NameDescription(nameVegetable: $viewmodel.name, descriptionVegetable: $viewmodel.description)
                            PickerCategoria(selectedOption: $viewmodel.categoria)
                            PickerFrequencia(selectedOption: $viewmodel.frequencia)
                            AddEditPhotos()
                                .environmentObject(imagesSelected)
                        }
                    }
                }
                
                VStack{
                    Spacer()
                    Button(action: {
                        // Só um teste
                        viewmodel.colorButton = "VerdeEscuro"
                        addVegetableAlert = true
                        if isFieldsFilled{
                            
                            plantViewModel.createPlant(name: viewmodel.name,
                                                       information: viewmodel.description,
                                                       category: viewmodel.categoria,
                                                       frequency: viewmodel.frequencia,
                                                       image: imagesSelected.imagesSelected)
                        }
                        
                    }) {
                        HStack {
                            Text("Adicionar Novo Vegetal")
                                .foregroundColor(Color("Branco"))
                                .font(.system(size: 16))
                                .bold()
                        }
                        .foregroundColor(Color("CinzaClaro"))
                        
                        .frame(width: 350, height: 42)
                        .background(Color(isFieldsFilled ? "VerdeEscuro" : "CinzaClaro"))
                        .cornerRadius(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(isFieldsFilled ? "VerdeEscuro" : "CinzaClaro"), lineWidth: 2)
                        )
                    }
                    .disabled(!isFieldsFilled)
                    .frame(alignment: .bottom)
                    .padding(.bottom, 60)
                    
                }
                if addVegetableAlert {
                    VStack {
                        CustomAlert(
                            title: "Planta cadastrada!",
                            message: "Vocë pode ver sua planta diferetamente na tela inicial, em \"Minha Horta\"",
                            primaryButtonTitle: "Ver planta",
                            primaryButtonAction: {
                                self.isFullScreenCovering = true
                                self.presentationMode.wrappedValue.dismiss()
                            },
                            secondaryButtonTitle: "Tela inicial",
                            secondaryButtonAction: {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        )
                        .padding(.top, 50)
                    }
                    .frame(width: 300, height: 100)
                    .zIndex(1)
                    .onAppear {
                        isOverlayShown = true
                    }
                }
                if discartVegetableAlert {
                    VStack {
                        CustomAlert(
                            title: "Deseja descartar a criação da sua planta ?",
                            message: "Essa ação não poderá ser desfeita",
                            primaryButtonTitle: "Descartar",
                            primaryButtonAction: {
                                self.presentationMode.wrappedValue.dismiss()
                            },
                            secondaryButtonTitle: "Cancelar",
                            secondaryButtonAction: {
                                discartVegetableAlert = false
                                isOverlayShown = false
                            }
                        )
                        .padding(.top, 50)
                    }
                    .frame(width: 300, height: 100)
                    .zIndex(1)
                    .onAppear {
                        isOverlayShown = true
                    }

                }
                if isOverlayShown {
                    Color.black.opacity(0.1)
                        .edgesIgnoringSafeArea(.all)
                    
                }
            }
            
            
            
        }
        .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: NavBar)
            .fullScreenCover(isPresented: self.$isFullScreenCovering) {
                InformationView(planta: plantViewModel.getPlant(by: viewmodel.name)!)
                
            }
    }
        
        struct AddVegetable_Previews: PreviewProvider {
            static var previews: some View {
                AddVegetable(plantViewModel: PlantViewModel())
            }
        }
    }
