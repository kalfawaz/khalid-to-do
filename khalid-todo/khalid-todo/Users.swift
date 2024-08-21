//
//  Users.swift
//  khalid-todo
//
//  Created by  khalid on 13/02/1446 AH.
//

import Foundation

struct User: Codable {
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}
