//
//  SignUpView.swift
//  MyCoffeeShopApp
//
//  Created by 장상경 on 9/24/24.
//

import SwiftUI

enum AlertError: String {
    case confirmError = "Password does not match."
    case blankError = "There are empty values."
    case duplicateError = "This is a duplicate email."
    case noError
}

struct SignUpView: View {
    
    @Binding var state: CurrentState
    
    init(state: Binding<CurrentState> = .constant(.loading)) {
        
        _state = state
    }
    
    @State private var signUpUserEmail: String = ""
    @State private var signUpUserPassword: String = ""
    @State private var confirmUserPassword: String = ""
    
    @State private var errorShowing: Bool = false
    @State private var error: AlertError = .noError
    
    @State var userInformation = UserInformation(userInformation: [:])
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Text("Sign Up")
                .font(.system(size: 25))
                .fontWeight(.medium)
            
            Rectangle()
                .frame(height: 100)
                .opacity(0)
            
            TextFieldModi(bindingValue: $signUpUserEmail, titleValue: "Email", subTitleValue: "Text your email")
                .padding(.bottom, 20)
            
            SecureFieldModi(bindingValue: $signUpUserPassword, titleValue: "Password", subTitleValue: "Text your password")
                .padding(.bottom, 20)
            
            SecureFieldModi(bindingValue: $confirmUserPassword, titleValue: "Confirm password", subTitleValue: "Text your password")
                .padding(.bottom, 40)
            
            Button(action: {
                print("Login button clicked")
                guard self.signUpUserPassword == self.confirmUserPassword else {
                    self.errorShowing = true
                    self.error = .confirmError
                    self.signUpUserPassword = ""
                    self.confirmUserPassword = ""
                    return
                }
                
                guard (self.userInformation.userInformation[self.signUpUserEmail]) == nil else {
                    self.error = .duplicateError
                    self.errorShowing = true
                    return
                }
                
                if self.signUpUserEmail.count > 0 && self.signUpUserPassword.count > 0 && self.confirmUserPassword.count > 0 {
                    
                    self.userInformation.userInformation[self.signUpUserEmail] = self.signUpUserPassword
                    
                    withAnimation {
                        self.state = .loading
                    }
                    
                } else {
                    self.error = .blankError
                    self.errorShowing = true
                }
            }) {
                Text("Log In")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(width: 350, height: 40)
                    .background(Color.coffee)
                    .cornerRadius(10)
            }
            .alert(error.rawValue, isPresented: $errorShowing) {
                Button("OK", role: .cancel) {
                    
                }
            }
            .padding(.bottom, 30)
            
            WebLogInButton()
            
            Spacer()

        }
        .padding(.horizontal, 20)
        
    }
}

#Preview {
    SignUpView()
}
