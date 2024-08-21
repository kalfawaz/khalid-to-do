//
//  SignupVeiw.swift
//  khalid-todo
//
//  Created by  khalid on 13/02/1446 AH.
//

import SwiftUI

struct SignupVeiw: View {
    @StateObject var veiwModel = SignupVeiwModel()
    var body: some View {
        HeadersVeiw(title: "Signup", subTitle: "Start Organize your Task", background: .blue)
        
        Form{
            TextField("Full Name ", text: $veiwModel.name)
                .padding(.vertical,8)
            TextField("Email Address", text: $veiwModel.email)
                .padding(.vertical,8)
            SecureField("Password ", text: $veiwModel.password)
                .padding(.vertical,8)
            
            TLButton(title: "Create Account", background: .blue){
                veiwModel.signup()
            }
            if !veiwModel.errorMessege.isEmpty {
                Text(veiwModel.errorMessege)
                    .foregroundColor(.red)
            }
            

        }
        .frame(height: 350)
        

        Spacer()
        
        
    }
}

#Preview {
    SignupVeiw()
}
