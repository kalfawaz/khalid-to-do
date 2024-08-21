//
//  ContentView.swift
//  khalid-todo
//
//  Created by  khalid on 12/02/1446 AH.
//

import SwiftUI

struct MainVeiw: View {
    @StateObject var veiwModel = MainVeiwModel()
    var body: some View {
        NavigationView{
            if veiwModel.isSignedIn, !veiwModel.currentUserId.isEmpty {
                //signedIn
                ToDoListVeiw()
            }else {
                LoginVeiw()
            }
            
        }
    }
}

#Preview {
    MainVeiw()
}
