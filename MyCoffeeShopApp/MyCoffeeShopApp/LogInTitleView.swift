//
//  LogInTitleView.swift
//  MyCoffeeShopApp
//
//  Created by 장상경 on 9/23/24.
//

import SwiftUI

enum CurrentCheckBox: String {
    case check = "checkmark.square.fill"
    case nonCheck = "checkmark.square"
}

struct LogInTitleView: View {
    
    @Binding var state: CurrentState
    @Binding var loginStatus: LoginStatus
    
    init(loginStatus: Binding<LoginStatus> = .constant(.loginFailed), state: Binding<CurrentState> = .constant(.loading)) {
        
        _loginStatus = loginStatus
        
        _state = state
    }
    
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @State private var checkBox: CurrentCheckBox = .nonCheck
    @State private var showing: Bool = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Text("Log In")
                .font(.system(size: 25))
                .fontWeight(.medium)
            
            Rectangle()
                .frame(height: 120)
                .opacity(0)
            
            TextFieldModi(bindingValue: $userEmail, titleValue: "Email", subTitleValue: "Text your email")
                .padding(.bottom, 15)
            
            SecureFieldModi(bindingValue: $userPassword, titleValue: "Password", subTitleValue: "Text your password")
            .padding(.bottom, 5)
            
            HStack(spacing: 0) {
                
                Image(systemName: checkBox.rawValue)
                    .padding(.trailing, 5)
                    .foregroundColor(.green)
                    .onTapGesture(perform: {
                        if self.checkBox == .nonCheck {
                            self.checkBox = .check
                        } else {
                            self.checkBox = .nonCheck
                        }
                    })
                
                Text("Remember me")
                    .font(.system(size: 12))
                    .fontWeight(.light)
                
                Spacer()
                
                Text("Forgot password?")
                    .font(.system(size: 12))
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
            }
            .padding(.bottom, 30)
            
            Button(action: {
                print("Log In")
                let savedUserEmail = UserDefaults.standard.string(forKey: "userEmail")
                let savedUserPassword = UserDefaults.standard.string(forKey: "userPassword")
                guard savedUserEmail == self.userEmail && savedUserPassword == self.userPassword else {
                    return showing = true
                }
                withAnimation {
                        self.loginStatus = .loginSucces
                        self.state = .loading
                        // 로그인 성공
                    }
                
            }, label: {
                Text("Log In")
                    .foregroundColor(.white)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .frame(width: 350, height: 40)
                    .background(Color.coffee)
                    .cornerRadius(10)
            })
            .alert("The email or password is invalid.", isPresented: $showing) {
                Button("OK", role: .cancel) {
                    if checkBox == .nonCheck {
                        self.userEmail = ""
                        self.userPassword = ""
                    } else {
                        self.userPassword = ""
                        return
                    }
                }
            }
            .padding(.bottom, 30)
            
            WebLogInButton()
            
            HStack {
                Text("Don't have an account?")
                    .font(.system(size: 12))
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                
                Button(action: {
                    
                }, label: {
                    Text("Register")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                })
            }
            
        }
        .padding(.horizontal, 20)
        
        Spacer()
    }
    
}

#Preview {
    LogInTitleView()
}
