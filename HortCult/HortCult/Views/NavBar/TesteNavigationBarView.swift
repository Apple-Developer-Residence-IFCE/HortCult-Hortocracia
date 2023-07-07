//
//  TesteNavigationBarView.swift
//  HortCult
//
//  Created by userext on 26/05/23.
//

import SwiftUI

struct TesteNavigationBarView: View {
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: CustomNavigationBarView()){
                Image("Add")
                
                
            }
            .toolbar(){
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Topbar")
                }
            }
            
        }
        
    }

}

struct TesteNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        TesteNavigationBarView()
    }
}
