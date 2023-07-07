//
//  EditVegetable.swift
//  HortCult
//
//  Created by João Vitor Alves Holanda on 14/06/23.
//

import SwiftUI

struct EditVegetable: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var plantViewModel: PlantViewModel
    @AppStorage ("selectedTheme")private var selectedTheme: Choice?
    var plant: Plant
    @StateObject var editViewmodel: EditVegetableViewModel
    @StateObject private var imagesSelected = ImageSelected()
    
    init(plant: Plant) {
        self.plant = plant
        _editViewmodel = StateObject(wrappedValue: EditVegetableViewModel(plant: plant))
//        imagesSelected.imagesSelected = $imagesSelected.dataImageConvert(datas: plant.image!)
    }

    var NavBar : some View {
        ZStack {
            Image(selectedTheme == .Escuro ? "Topbardark" : "Topbar")
            HStack {
                Button(action:{
                    self.presentationMode.wrappedValue.dismiss()
                } ) {
                    Image("Arrow-Left")
                }
                .padding(.leading, 18)
                Spacer()
            }
        }
        
    }
    
    var isFieldsFilled: Bool{
        return !editViewmodel.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !editViewmodel.description.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && editViewmodel.categoria != "Selecionar..." && editViewmodel.frequencia != "Selecionar..."
    }
    
    var body: some View {
        
        NavigationView {
            ZStack{
                ScrollView(.vertical){
                    ZStack{
                        VStack{
                            AddEditTitle(addEdit: false)
                            NameDescription(nameVegetable: $editViewmodel.name, descriptionVegetable: $editViewmodel.description)
                            PickerCategoria(selectedOption: $editViewmodel.categoria)
                            PickerFrequencia(selectedOption: $editViewmodel.frequencia)
                            AddEditPhotos()
                                .environmentObject(imagesSelected)
                        }
                    }
                }
                .padding(.bottom, 100)
                
                Button(action: {
                    if isFieldsFilled{
                        self.presentationMode.wrappedValue.dismiss()
                        plantViewModel.updatePlant(plant: plant, name: editViewmodel.name, information: editViewmodel.description, category: editViewmodel.categoria, frequency: editViewmodel.frequencia, nextDate: plant.nextDate ?? Date() , image: imagesSelected.imagesSelected)
                    }
                    
                }) {
                    HStack {
                        Text("Salvar Alterações")
                            .foregroundColor(Color("Branco"))
                            .font(Font.custom("Satoshi-Regular", size: 16))
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
                    .padding(.top, 602)
            }
            
            
//
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBar)
        
    }
    
}
struct EditVegetable_Previews: PreviewProvider {
    static var previews: some View {
        TesteEditar()
    }
}

struct TesteEditar: View {
    
    var body: some View {
        EditVegetable(plant: Plant())
            .environmentObject(PlantViewModel())
    }
}
