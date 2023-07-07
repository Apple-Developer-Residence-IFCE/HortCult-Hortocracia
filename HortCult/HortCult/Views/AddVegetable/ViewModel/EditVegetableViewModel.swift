//
//  EditVegetableViewModel.swift
//  HortCult
//
//  Created by Victor Viana on 30/06/23.
//

import SwiftUI


class EditVegetableViewModel: ObservableObject {
    
    @Published var colorButton: String
    @Published var plant: Plant
    @Published var name : String
    @Published var description : String
    @Published var categoria : String
    @Published var frequencia : String
    
    init(plant: Plant) {
        self.colorButton = "CinzaClaro"
        self.plant = plant
        self.name = plant.name ?? ""
        self.description = plant.information ?? ""
        self.categoria = plant.category ?? ""
        self.frequencia = plant.frequency ?? ""
    }
}
