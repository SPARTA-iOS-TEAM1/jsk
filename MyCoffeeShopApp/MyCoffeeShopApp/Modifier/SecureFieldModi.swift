//
//  SecureFieldModi.swift
//  MyCoffeeShopApp
//
//  Created by 장상경 on 9/24/24.
//

import SwiftUI

struct SecureFieldModi: View {
    
    var titleValue: String
    var subTitleValue: String
    
    @Binding private var bindingValue: String
    
    init(bindingValue: Binding<String> = .constant(""), titleValue: String, subTitleValue: String) {
        
        _bindingValue = bindingValue
        self.titleValue = titleValue
        self.subTitleValue = subTitleValue
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text(titleValue)
                .padding(.bottom, 8)
                .fontWeight(.medium)
                .font(.system(size: 18))
            
            HStack {
                SecureField(subTitleValue, text: $bindingValue)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                Button(action: {
                    print("Delete")
                    self.bindingValue = ""
                }) {
                    if (self.bindingValue.count > 0) {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.secondary)
                            .font(.system(size: 25))
                    }
                }
            }
        }
    }
}

#Preview {
    SecureFieldModi(titleValue: "Password", subTitleValue: "Text your password")
}
