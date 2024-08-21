//
//  SignupVeiwModel.swift
//  khalid-todo
//
//  Created by  khalid on 13/02/1446 AH.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class SignupVeiwModel : ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var errorMessege = ""

    
    init(){}
    
    func signup(){
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){ [weak self]
            result, error in
            guard let userId = result?.user.uid else {
                return
            }
            
            self?.insertUserRecord(id: userId)
            
        }
        
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    
    func validate() -> Bool{
        errorMessege = ""
        guard !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            errorMessege = "Please fill all the required fieled"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessege = "Please enter a valid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessege = "Password should have more than 6 charcters"
            return false
        }
        return true
                
    }
    
}
