//
//  CustomNavigationBarView.swift
//  HortCult
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct CustomNavigationBarView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var NavBar : some View {
        ZStack {
            Image("Topbar")
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
    var body: some View {
        NavigationView {
            VStack{
              NavBar
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: NavBar)
        
    }
}
struct CustomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBarView()
    }
}
