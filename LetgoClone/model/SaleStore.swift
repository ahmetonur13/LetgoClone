//
//  SaleStore.swift
//  LetgoClone
//
//  Created by Ahmet Onur on 26.10.2023.
//

import Foundation
import Firebase
import Combine
import FirebaseStorage

class SaleStore : ObservableObject{
    var ilanArray : [SaleModel] = []
    let db = Firestore.firestore()
    let storage = Storage.storage()
    var objectWillChange = PassthroughSubject<Array<Any>,Never>()

    init(){
        db.collection("ilanlar").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription)
            }else{
                self.ilanArray.removeAll(keepingCapacity: false)
                for document in snapshot!.documents{
                        if let ilanDetail = document.get("ilanDetail") as? String{
                           if let ilanTitle = document.get("ilanName") as? String {
                               if let uidFromFirebase = document.get("userIDFromFirebase") as? String{
                            //                            if let ilanDate = document.get("ilanDate") as? String{
                            //                                    let dateFormatter = DateFormatter()
                            //                                    dateFormatter.dateFormat="yyyy_MM_dd_hh_mm_ss"
                            //                                    let dateFormatFB = dateFormatter.date(from: ilanDate)
                            let currentIndex = self.ilanArray.last?.id
                            let createdIlan = SaleModel(id: (currentIndex ?? -1) + 1, uidForFirebase: uidFromFirebase, ilanDetail: ilanDetail,ilanTitle: ilanTitle
                                                        //                                      ilanDate: dateFormatFB!,
                            )
                            self.ilanArray.append(createdIlan)
                        }
                    }
                }}
                }
                self.objectWillChange.send(self.ilanArray)
            }
        }
}
