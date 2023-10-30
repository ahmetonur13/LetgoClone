//
//  UserModel.swift
//  LetgoClone
//
//  Created by Ahmet Onur on 19.10.2023.
//

import Foundation

struct UserModel : Identifiable{
    var id : Int
    var uidFromFirebase : String
    var email : String
    var password : String
}
