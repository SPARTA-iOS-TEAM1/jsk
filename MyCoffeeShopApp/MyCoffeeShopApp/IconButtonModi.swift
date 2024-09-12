//
//  IconButtonModi.swift
//  MyCoffeeShopApp
//
//  Created by 장상경 on 9/12/24.
//

import SwiftUI

struct IconButtonModi: View {
    
    var iconName: String
    var buttonName: String
    
    var body: some View {
    
        HStack(alignment: .center, spacing: 0) {
            Image(iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20)
                .padding(.trailing, 10)
            
            Text(buttonName)
                .font(.system(size: 15))
                .fontWeight(.medium)
                .foregroundColor(.black)
        }
        .frame(width: 350, height: 35)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}

#Preview {
    IconButtonModi(iconName: "googleIcon", buttonName: "Continue with Google")
}
