//
//  TLButton.swift
//  khalid-todo
//
//  Created by  khalid on 17/02/1446 AH.
//

import SwiftUI

struct TLButton: View {
    let title : String
    let background : Color
    let action: () -> Void
    var body: some View {
        Button{
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }.padding()
    }
}

#Preview {
    TLButton(title: "Log In", background: .blue, action: {})
}
