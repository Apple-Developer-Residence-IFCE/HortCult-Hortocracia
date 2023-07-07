//
//  UserVerification.swift
//  HortCult
//
//  Created by userext on 29/05/23.
//

import SwiftUI

struct UserVerification: View {
    @Binding var isLoggedIn: Bool
    var body: some View {
        Group {
            if isLoggedIn {
                TestePseudoHome()
            } else {
                VStack {
                    Text("Bem-vindo ao nosso aplicativo!")
                        .font(.title)
                        .padding()
                    
                    Button(action: {
                        
                    }) {
                        Text("Criar Conta")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .onAppear {
            isLoggedIn = UserDefaults.standard.bool(forKey: "IsLoggedIn")
            
        }
    }
    
    struct UserVerification_Previews: PreviewProvider {
        static var previews: some View {
            UserVerification(isLoggedIn: true)
        }
    }
