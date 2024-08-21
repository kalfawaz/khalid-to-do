//
//  MainVeiwVeiwModel.swift
//  khalid-todo
//
//  Created by  khalid on 13/02/1446 AH.
//

import Foundation
import FirebaseAuth
class MainVeiwModel: ObservableObject{
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
