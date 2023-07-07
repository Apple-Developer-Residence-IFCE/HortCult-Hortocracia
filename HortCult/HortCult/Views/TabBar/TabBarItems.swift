//
//  TabBarItems.swift
//  HortCult
//
//  Created by Gabriel Carvalho on 29/06/23.
//

import Foundation

enum TabBarItems: Int, CaseIterable {
    
    case homeView = 0
    case settingsView
    
    
    var iconName: String {
        
        switch self {
        case .homeView:
            return "Home-Icon"
        case .settingsView:
            return "Settings-Icon"
            
        }
        
    }
}
