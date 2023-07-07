//
//  HeaderLogo.swift
//  HortCult
//
//  Created by Joao Guilherme Araujo Canuto on 29/06/23.
//

import SwiftUI


struct HeaderLogo: View {
    var heigthHeader:Double = 75
    
    var body: some View {
        VStack{
            Rectangle()
                .foregroundColor(Color("BackgroundLogo"))
                .frame(width: .infinity, height: 30)
            ZStack{
                Rectangle()
                    .foregroundColor(Color("BackgroundLogo"))
                    .frame(width: .infinity, height: heigthHeader)
                Image("Logo")
            }
            .padding(-10)
            Divider()
        }
    }
}

struct HeaderLogo_Previews: PreviewProvider {
    static var previews: some View {
        HeaderLogo()
    }
}
