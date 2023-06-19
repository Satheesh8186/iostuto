//
//  UserModel.swift
//  CombineUI
//
//  Created by satheesh kumar on 19/06/23.
//

import Foundation

struct User:Codable,Identifiable{
    let id: Int
    let name: String
    let email: String
}
