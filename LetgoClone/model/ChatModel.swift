//
//  ChatModel.swift
//  LetgoClone
//
//  Created by Ahmet Onur on 29.10.2023.
//

import Foundation
struct ChatModel : Identifiable{
    var id : Int
    var messageTo : String
    var messageFrom : String
    var message : String
    var uidFromFirebase : String
}
