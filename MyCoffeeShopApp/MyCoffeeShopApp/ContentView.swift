//
//  ContentView.swift
//  MyCoffeeShopApp
//
//  Created by 장상경 on 9/12/24.
//

import SwiftUI

enum LoginStatus {
    case loginSucces
    case loginFailed
}

enum CurrentState {
    case loading
    case success
    case login
    case main
}

struct ContentView: View {
    
    @State private var state: CurrentState = .loading
    @State private var loginStatus: LoginStatus = .loginFailed
    
    var body: some View {

            switch state {
            case .loading:
                SplashScreenView()
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                if self.loginStatus == .loginSucces {
                                    self.state = .main
                                } else {
                                    self.state = .success
                                }
                            }
                        }
                    })
                
            case .success:
                StartedView(state: $state)
            case .login:
                LogInView(loginStatus: $loginStatus, state: $state)
            case .main:
                MainTitleView()
            default:
                SplashScreenView()
            }
        
    }
}

#Preview {
    ContentView()
}
