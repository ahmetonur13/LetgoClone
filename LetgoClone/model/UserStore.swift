//
//  UserStore.swift
//  LetgoClone
//
//  Created by Ahmet Onur on 19.10.2023.
//

import Foundation
import Firebase
import Combine

class UserStore : ObservableObject{
     var userList = [UserModel]()
    let db = Firestore.firestore()
    
    var objectWillChange = PassthroughSubject<Array<Any>, Never>()
    init(){
        db.collection("users").addSnapshotListener { (snapshot, error) in
            if error != nil{
                print(error!.localizedDescription)
            }else{
                self.userList.removeAll(keepingCapacity: false)
                for document in snapshot!.documents {
                    if let userIDFromFirebase = document.get("uidFromFirebase") as? String{
                        if let userEmail = document.get("name")as? String{
                            if let userPassword = document.get("password")as? String{
                                let currentIndex = self.userList.last?.id
                                let createdUser = UserModel(id: (currentIndex ?? -1) + 1, uidFromFirebase: userIDFromFirebase, email: userEmail , password: userPassword)
                                self.userList.append(createdUser)

                            }
                        }
                    }
                }
            }
            self.objectWillChange.send(self.userList)
        }
 }
}
