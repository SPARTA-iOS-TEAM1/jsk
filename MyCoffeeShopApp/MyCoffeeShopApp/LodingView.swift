//
//  LodingView.swift
//  MyCoffeeShopApp
//
//  Created by 장상경 on 9/12/24.
//

import SwiftUI

struct LodingView: View {
    var body: some View {
        
        VStack(spacing: 0) {
            
            Spacer()
            
            Image("Vector")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 100)
            
            Text("Cafedi")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .foregroundColor(.coffee)
            
            Spacer()
            Spacer()
        }
        
    }
}

#Preview {
    LodingView()
}
