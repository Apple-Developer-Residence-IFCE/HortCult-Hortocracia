//
//  PlantViewModel.swift
//  HortCult
//
//  Created by Pedro Henrique Santos Rodrigues on 14/06/23.
//

import Foundation
import CoreData
import SwiftUI
import Combine
import UIKit
class PlantViewModel: ObservableObject {
    let viewcontext = PersistenceController.shared.container.viewContext
    @Published var plant = [Plant]()
    
    func imageDataConvert(image: [UIImage]) -> [Data]{
        var datasList: [Data] = []
        for i in 0..<image.count{
            if let imageData = image[i].jpegData(compressionQuality: 1.0) {
                datasList.append(imageData)
            } else if let imageData = image[i].pngData() {
                datasList.append(imageData)
            }
        }
        return datasList
    }
    
    func getPlantId(id: UUID) -> Plant?{
        for planta in self.plant{
            if(planta.id == id){
                return planta;
            }
        }
        return nil
    }
    func getPlant(by name: String) -> Plant? {
        for planta in self.plant{
            if(planta.name == name){
                return planta;
            }
        }
        return nil
    }
    
    func dataImageConvert(datas: [Data]) -> [UIImage]{
        var imagesList: [UIImage] = []
        for i in 0..<datas.count{
            if let uiImage = UIImage(data: datas[i]) {
                imagesList.append(uiImage)
            }
        }
        return imagesList
    }
    
    func fetch() {
        let fetchRequest: NSFetchRequest<Plant> = Plant.fetchRequest()
        guard let fetchPlants = try? viewcontext.fetch(fetchRequest) else {
            return
        }
        
        plant = fetchPlants
    }
    
    func createPlant(name: String, information: String, category: String, frequency: String, image: [UIImage]){
        
        var formattedToday: Date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let formattedTodayString = formatter.string(from: formattedToday)
        formattedToday = formatter.date(from: formattedTodayString) ?? Date()
        
        let newPlant = Plant(context: viewcontext)
        newPlant.id = UUID()
        newPlant.name = name
        newPlant.information = information
        newPlant.category = category
        newPlant.frequency = frequency
        newPlant.image = imageDataConvert(image: image)
        newPlant.nextDate = formattedToday
        
        do {
            try viewcontext.save()
            fetch()
            print("criou a planta \(name)")
        }catch let error as NSError{
            print("Náo foi possivel salvar \(error) \(error.userInfo)")
        }
    }
    
    func deletePlant(plant: Plant){
        viewcontext.delete(plant)
        do{
            try viewcontext.save()
            fetch()
        }catch let error as NSError{
            print("Náo foi possivel salvar \(error) \(error.userInfo)")
        }
    }
    
    func updatePlant(plant: Plant, name: String, information: String, category: String, frequency: String, nextDate: Date, image: [UIImage]){
        
        var formattedNextDate: Date = nextDate
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        let formattedString = formatter.string(from: formattedNextDate)
        formattedNextDate = formatter.date(from: formattedString) ?? Date()
        
        plant.id = plant.id
        plant.name = name
        plant.information = information
        plant.category = category
        plant.frequency = frequency
        plant.nextDate = formattedNextDate
        plant.image = imageDataConvert(image: image)
        do{
            try viewcontext.save()
            fetch()
        }catch let error as NSError{
            print("Nào foi possivel atualizar \(error) \(error.userInfo)")
        }
    }
    
    func filterPlant() -> [Plant] {
        
        var plantsArray = [Plant]()
        var formatedToday = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatedToday = formatter.date(from: String(formatedToday.formatted().prefix(10))) ?? Date()
        
        for planta in self.plant{
            if(planta.nextDate! <= formatedToday){
                plantsArray.append(planta)
            }
        }
    
        return plantsArray
    }
    
//

}
