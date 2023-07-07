//
//  HortCultApp.swift
//  HortCult
//
//  Created by userext on 23/05/23.
//

import SwiftUI

@main
struct HortCultApp: App {
    //let persistenceController = PersistenceController.shared
    
    @AppStorage ("isFirstLogin") static var isFirstLogin: Bool = true
    @AppStorage ("selectedTheme") private var selectedTheme: Choice?
    @Environment (\.colorScheme) var colorScheme
    
    
    var body: some Scene {
        WindowGroup {
                
                if HortCultApp.isFirstLogin == true {
                    Splash()
                        .preferredColorScheme(selectedTheme == .Claro ? .light : (selectedTheme == .Escuro ? .dark : .none))
                } else {
                    TabBarView(plantViewModel: PlantViewModel())
                        .preferredColorScheme(selectedTheme == .Claro ? .light : (selectedTheme == .Escuro ? .dark : .none))
                }
        }
    }
}
