//
//  ImagesListView.swift
//  HortCult
//
//  Created by userext on 30/05/23.
//

import SwiftUI

struct CustomNavBarInfoView<Content: View>: View {
@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    @ViewBuilder var content: () -> Content
    
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
            NavigationView {
                ZStack {
                    self.content()
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: .center)
                        .edgesIgnoringSafeArea(.all).allowsHitTesting(false)
//                    HStack{
//                        Button(action:{
//                            self.presentationMode.wrappedValue.dismiss()
//                        } ) {
//                            Image("Arrow-Left-Light")
//                        }
//                        .padding(.leading, 18)
//                        Spacer()
//                        Text("Voltar").foregroundColor(.white)
//                    }
                }
//
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: NavBarInfo)
            
        }
}

struct CustomNavBarInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarInfoView() {
            Text("TESTE")
        }
    }
}
