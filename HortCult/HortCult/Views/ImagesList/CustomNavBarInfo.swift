//
//  ImagesListView.swift
//  HortCult
//
//  Created by userext on 30/05/23.
//

import SwiftUI

struct CustomNavBarInfo: View {
@Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    var NavBarInfo : some View {
            ZStack {
                HStack{
                    Button(action:{
                        self.presentationMode.wrappedValue.dismiss()
                    } ) {
                        Image("Arrow-Left-Light")
                    }
                    .padding(.leading, 18)
                    Spacer()
                    Text("Voltar").foregroundColor(.white)
                }
            }
        
    }
    
        var body: some View {
            NavigationView {
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.clear]), startPoint: .top, endPoint: .center)
                                .edgesIgnoringSafeArea(.all)
//                    HStack(alignment: .top){
//                        ScrollView(.horizontal) { // <1>
//                            HStack { // <2>
//                                        ForEach(0..<10) { index in
//                                            Image("Tomatinho")
//                                                .frame(alignment: .center)
//                                        }
//                                    }.frame(maxHeight: .infinity)
//                                }.font(.largeTitle)
//                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: NavBarInfo)
        }
}

struct CustomNavBarInfo_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarInfo()
    }
}
