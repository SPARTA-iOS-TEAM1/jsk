//
//  LogInView.swift
//  MyCoffeeShopApp
//
//  Created by 장상경 on 9/12/24.
//

import SwiftUI

struct LogInView: View {
    
    @Binding var state: CurrentState
    @Binding var loginStatus: LoginStatus
    
    init(loginStatus: Binding<LoginStatus> = .constant(.loginFailed), state: Binding<CurrentState> = .constant(.loading)) {
        
        _loginStatus = loginStatus
        
        _state = state
    }
    
    var body: some View {
        
        NavigationView {
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
                
                NavigationLink(destination: LogInTitleView(loginStatus: $loginStatus, state: $state)) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .frame(width: 320, height: 40)
                        .background(Color.coffee)
                        .cornerRadius(10)
                }
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
                
                WebLogInButton()
                
                Spacer()
                Spacer()
                Spacer()
                
            }
        }
    }
}

#Preview {
    LogInView()
}
