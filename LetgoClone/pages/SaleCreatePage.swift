//
//  SalePage.swift
//  LetgoClone
//
//  Created by Ahmet Onur on 19.10.2023.
//

import SwiftUI
import Firebase
import FirebaseStorage
import PhotosUI
struct SalePage: View {
    @State private var productText = ""
    @State private var productDetail = ""
    @State private var showAlert = false
    @State private var selectedImages : [PhotosPickerItem] = []
    @State private var data : Data?
    let storageRef = Storage.storage().reference()
    @EnvironmentObject var session : SessionManager
    let db = Firestore.firestore()
    var body: some View {
        NavigationView{
            VStack{
                Section{
                    PhotosPicker( selection: $selectedImages,maxSelectionCount: 3,matching: .images){
                        Text("Select Photo")
                    }.onChange(of: selectedImages) { newValue in
                        guard let item = selectedImages.first else{
                            return
                        }
                        item.loadTransferable(type: Data.self) { result in
                            switch result{
                            case .success(let data):
                                if let data = data{
                                    self.data = data
                                }
                            case .failure(let error):
                                print(error)
                            }
                        }
                    }
                    TextField("Please Write Your Product Title", text: $productText)
                    TextField("Please Tell Me Details",text: $productDetail)
                }.textFieldStyle(.roundedBorder)
                Button("Publish") {
                    if productText != "" && productDetail != "" && selectedImages != []{
//                        User Upload                   //
                        db.collection("ilanlar").addDocument(data: ["ilanName" : productText , "ilanDetail" : productDetail,"userIDFromFirebase" : session.loggedUser!.uid,"ilanDate" : Date.now])
                        productText.removeAll()
                        productDetail.removeAll()
//                        Photo Upload                  //
                        if data != nil {
                            storageRef.child("ilanImage/jpg").putData( data! ,metadata: nil){metadata ,error in
                                if error != nil{
                                    print(error?.localizedDescription)
                                }
                                }
                            selectedImages.removeAll()
                            }
                        
                    }else{
                        showAlert = true
                    }
                }
            }.padding().navigationTitle("Publish Product").alert(isPresented: $showAlert) {
                Alert(title: Text("Please Do Not Pass Empty"))
            }
            
        }
    }
}

struct SalePage_Previews: PreviewProvider {
    static var previews: some View {
        SalePage()
    }
}
