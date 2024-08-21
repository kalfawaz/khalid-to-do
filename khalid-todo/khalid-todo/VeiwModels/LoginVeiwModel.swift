//
//  LoginVeiwModel.swift
//  khalid-todo
//
//  Created by  khalid on 13/02/1446 AH.
//

import Foundation
import FirebaseAuth
class LoginVeiwModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMesage = ""
    
    init() {

    }
    
    func login(){
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool{
        errorMesage = ""
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            errorMesage = "Please fill all the required fieled"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMesage = "Please enter a valid email"
            return false
        }
        
        return true
    }
}

