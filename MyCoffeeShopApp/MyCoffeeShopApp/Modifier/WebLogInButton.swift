//
//  WebLogInButton.swift
//  MyCoffeeShopApp
//
//  Created by 장상경 on 9/23/24.
//

import SwiftUI

struct WebLogInButton: View {
    var body: some View {
        
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

        
    }
}

#Preview {
    WebLogInButton()
}
