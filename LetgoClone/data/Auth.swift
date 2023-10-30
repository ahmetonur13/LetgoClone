//
//  Auth.swift
//  LetgoClone
//
//  Created by Ahmet Onur on 19.10.2023.
//

import Foundation
import Firebase

class Authection {
    let auth = Auth.auth()
    func createUserEmail(email : String, password : String){
        auth.createUser(withEmail: email, password: password){result , error in
            if error == nil{
                print("kaydedildi")
            }
        }
    }
    func signInEmail(email : String, password : String){
        auth.signIn(withEmail: email, password: password){result , error in
        if error == nil{
            print("giris basarili")
        } else{
            print(error!.localizedDescription)
        }
    }
    }
}
