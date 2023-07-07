
//  CustomTabItem.swift
//  HortCult
//
//  Created by Gabriel Carvalho on 29/06/23.


import SwiftUI

extension TabBarView {
    func CustomTabItem(imageName: String, isActive: Bool) -> some View {
        HStack {
            Spacer()
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .green : .black)
                .frame(width: 30, height: 30)
            Spacer()
        }
    }
}
