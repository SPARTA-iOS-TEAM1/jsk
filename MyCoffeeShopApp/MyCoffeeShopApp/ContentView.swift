//
//  ContentView.swift
//  MyCoffeeShopApp
//
//  Created by 장상경 on 9/12/24.
//

import SwiftUI

enum LodingState {
    case loding
    case success
    case login
}

struct ContentView: View {
    
    @State private var state: LodingState = .loding
    
    var body: some View {

            switch state {
            case .loding:
                LodingView()
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                self.state = .success
                            }
                        }
                    })
                
            case .success:
                StartedView(state: $state)
                
            case .login:
                LogInView()
            default:
                LodingView()
            }
        
    }
}

#Preview {
    ContentView()
}
