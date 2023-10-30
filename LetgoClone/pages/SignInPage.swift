//
//  SignInPage.swift
//  LetgoClone
//
//  Created by Ahmet Onur on 19.10.2023.
//

import SwiftUI
import Firebase

struct SignInPage: View {
  @State private var emailText = ""
  @State private var password = ""
  @State private var showAlert = false
//  @State var showAuthView = true
    @EnvironmentObject var userStore : UserStore
    @EnvironmentObject var session : SessionManager
    let auth = Auth.auth()
    let db = Firestore.firestore()
    var body: some View {
        if session.loggedUser == nil{
        NavigationView
        {
                VStack{
                    Image(systemName: "person").foregroundColor(.blue).imageScale(.large)
                    Section{
                        TextField("Email", text: $emailText)
                        SecureField("Password", text: $password)
                    }.textFieldStyle(.roundedBorder)
                      HStack{
                          Button("Sign UP"){
                          if emailText != "" && password != "" {
                              auth.createUser(withEmail: emailText, password: password) {(result, error) in
                                  if error != nil{
                                      print(error?.localizedDescription)
                                  }else{
                                      db.collection("users").addDocument(data: ["email" : emailText,"uidFromFirebase" : session.loggedUser!.uid])
                                      emailText.removeAll()
                                      password.removeAll()
                                  }
                              }
                            }else{
                                showAlert = true
                            }
                        }
                        Button("Sign IN"){
                            if emailText != "" && password != "" {
                                auth.signIn(withEmail: emailText, password: password){
                                    (result , error) in
                                    if error != nil{
                                        print(error?.localizedDescription)
                                    }else{
//                                        ProgressView()
                                        emailText.removeAll()
                                        password.removeAll()
                                    }
                                }
                                
                            }else{
                                showAlert = true
                            }
                        }.padding()
                      }.alert(isPresented: $showAlert) {
                            Alert(title: Text("Please Do Not Empty"), message: Text("Name Surname Email and Password can't empty."))
                      }.padding()
                    
                }.navigationTitle("Welcome").padding()
            }.padding()
            } else if auth.currentUser != nil{
                TabBarPage()
        }
    }
}
struct SignInPage_Previews: PreviewProvider {
    static var previews: some View {
        SignInPage(
//            showAuthView: true
        )
    }
}
