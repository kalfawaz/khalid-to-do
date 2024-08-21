//
//  LoginVeiw.swift
//  khalid-todo
//
//  Created by  khalid on 13/02/1446 AH.
//

import SwiftUI

struct LoginVeiw: View {
    @StateObject var veiwModel = LoginVeiwModel()
    var body: some View {
        NavigationView{
            VStack {
                HeadersVeiw(title: "To Do List App", subTitle: "Get Things Done", background: Color.blue)
                Form {
                    TextField("Email Address", text: $veiwModel.email)
                        .padding()
                    SecureField("Password", text: $veiwModel.password)
                        .padding()
                    
                    TLButton(title: "Log In", background: .blue){
                        veiwModel.login()
                    }
                    if !veiwModel.errorMesage.isEmpty {
                        Text(veiwModel.errorMesage)
                            .foregroundColor(.red)
                    }
                }.frame(height: 450)

                
                HStack{
                    Text("New around here?")
                    NavigationLink("Create an account", destination: SignupVeiw())
                }.padding(.bottom, 100)


            }
        }.onAppear(){
            let appearance = UINavigationBarAppearance()
            appearance.backButtonAppearance = UIBarButtonItemAppearance()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
        
    }
}

#Preview {
    LoginVeiw()
}
