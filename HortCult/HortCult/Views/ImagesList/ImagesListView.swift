//
//  ImagesListView.swift
//  HortCult
//
//  Created by userext on 31/05/23.
//

import SwiftUI

struct ImagesListView: View {
    @State var images: [UIImage]
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(0..<images.count) { i in
                Image(uiImage: images[i])
                    .resizable()
                    .tag(i)
                    .tabItem {
                        Text("Tab \(i + 1)")
                    }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .ignoresSafeArea()
    }
}

struct ImagesListView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesListView(images: [])
    }
}
