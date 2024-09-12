//
//  StartedView.swift
//  MyCoffeeShopApp
//
//  Created by 장상경 on 9/12/24.
//

import SwiftUI

struct StartedView: View {
    
    @Binding var state: CurrentState
    
    init(state: Binding<CurrentState> = .constant(.loading)) {
        
        _state = state
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            Image("Free shipping-rafiki 1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text("Explore now\nto experience the benefits")
                .multilineTextAlignment(.center)
                .font(.system(size: 25))
                .padding(.bottom, 18)
            
            Text("Lorem ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor\nincididunt ut labore")
                .multilineTextAlignment(.center)
                .font(.system(size: 13))
                .foregroundColor(.gray)
                .fontWeight(.light)
                .padding(.bottom, 50)
            
            Button(action: {
                print("Get Started")
                withAnimation {
                    self.state = .login
                }
                
            }) {
                Text("Get Started")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(width: 320, height: 35)
                    .background(Color.coffee)
                    .cornerRadius(10)
            }
        }

        
    }
}

#Preview {
    StartedView()
}
