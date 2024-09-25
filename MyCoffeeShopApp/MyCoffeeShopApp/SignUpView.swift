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
    case emailError = "The email format is invalid."
    case noError
}

struct SignUpView: View {
    
    @Binding var state: CurrentState
    @Binding var loginStatus: LoginStatus
    
    init(loginStatus: Binding<LoginStatus> = .constant(.loginFailed), state: Binding<CurrentState> = .constant(.loading)) {
        
        _loginStatus = loginStatus
        
        _state = state
    }
    
    @State private var signUpUserEmail: String = ""
    @State private var signUpUserPassword: String = ""
    @State private var confirmUserPassword: String = ""
    
    @State private var errorShowing: Bool = false
    @State private var error: AlertError = .noError
    
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
                
                guard isValidEmail(id: self.signUpUserEmail) else {
                    self.signUpUserEmail = ""
                    self.errorShowing = true
                    self.error = .emailError
                    return
                }
                
                if self.signUpUserEmail.count > 0 && self.signUpUserPassword.count > 0 && self.confirmUserPassword.count > 0 {

                    UserDefaults.standard.set(self.signUpUserEmail, forKey: "userEmail")
                    UserDefaults.standard.set(self.signUpUserPassword, forKey: "userPassword")
                    
                    withAnimation {
                        self.loginStatus = .signUp
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

func isValidEmail(id: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: id)
}

#Preview {
    SignUpView()
}
