//
//  headersVeiw.swift
//  khalid-todo
//
//  Created by  khalid on 17/02/1446 AH.
//

import SwiftUI

struct HeadersVeiw: View {
    let title: String
    let subTitle: String
    let background: Color
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text(subTitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300 )
    }
}

#Preview {
    HeadersVeiw(title: "To Do List", subTitle: "Get things done", background: Color.blue)
}
