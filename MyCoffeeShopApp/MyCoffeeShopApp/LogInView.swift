//
//  LogInView.swift
//  MyCoffeeShopApp
//
//  Created by 장상경 on 9/12/24.
//

import SwiftUI

struct LogInView: View {
    
    
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Spacer()
            Spacer()
            
            Image("Vector")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 100)
            
            Text("Cafedi")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(.coffee)
                .padding(.bottom, 50)
            
            Button(action: {
                print("Log In")
                
            }, label: {
                Text("Log In")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(width: 320, height: 40)
                    .background(Color.coffee)
                    .cornerRadius(10)
            })
            .padding(.bottom, 15)
            
            Button(action: {
                print("Sign Up")
                
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 320, height: 40)
                        .cornerRadius(10)
                        .foregroundColor(.coffee)
                    
                    Text("Sign Up")
                        .foregroundColor(.coffee)
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .frame(width: 317.5, height: 37.5)
                        .background(Color.white)
                        .cornerRadius(9)
                }
            }.padding(.bottom, 30)
            
            HStack {
                VStack {
                    Divider()
                        .padding(.leading, 10)
                }
                Text("OR")
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                VStack {
                    Divider()
                        .padding(.trailing, 10)
                }
            }
            .padding(.bottom, 30)
            
            Button(action: {
                
            }) {
                IconButtonModi(iconName: "googleIcon", buttonName: "Continue with Google")
                    .padding(.bottom)
            }
            
            Button(action: {
                
            }) {
                IconButtonModi(iconName: "facebookIcon", buttonName: "Continue with Facebook")
                    .padding(.bottom, 8)
            }
//            HStack {
//                Text("Don't have an account?")
//                    .font(.system(size: 12))
//                    .fontWeight(.light)
//                    .foregroundColor(.gray)
//                
//                Button(action: {
//                    
//                }, label: {
//                    Text("Register")
//                        .font(.system(size: 12))
//                        .fontWeight(.medium)
//                })
//            }
            
            Spacer()
            Spacer()
            Spacer()
            
        }
        
    }
}

#Preview {
    LogInView()
}
