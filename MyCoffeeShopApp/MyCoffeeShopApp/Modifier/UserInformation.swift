//
//  UserInformation.swift
//  MyCoffeeShopApp
//
//  Created by 장상경 on 9/24/24.
//

import SwiftUI

final class UserModel {
    struct UserInformation: Hashable {
        var email: String
        var password: String
    }
    
    var user: [UserInformation] = [
        UserInformation(email: "admin0123@naver.com", password: "admin0123")
    ]
    
    // 아이디 형식 검사(이메일)
    func isValidEmail(id: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailText = NSPredicate(format: "SELF MATCHES &@", emailRegEx)
        return emailText.evaluate(with: id)
    }
    
    func userIdAndPasswordCheck(id: String, password: String, check: Binding<UserModel>) -> Bool {
        for user in check.user {
            guard user.wrappedValue.email == id && user.wrappedValue.password == password else {
                return false
            }          
        }
        return true
    }
    
    func userInsert(id: String, password: String, insert: Binding<UserModel>) {
        insert.wrappedValue.user.append(.init(email: id, password: password))
    }
}

