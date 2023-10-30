//
//  TabBarPage.swift
//  LetgoClone
//
//  Created by Ahmet Onur on 19.10.2023.
//

import SwiftUI
import Firebase
struct TabBarPage: View {
    let auth = Auth.auth()
    var body: some View {
        TabView{
            if auth.currentUser != nil{
                MainPage().tabItem {
                    Image(systemName: "bag")
                    Text("MainPage")
                }.tag(0)
                ChatView(userToChat: UserModel(id: 0, uidFromFirebase: "wh9d8FaJLLU3tu96tgigy8FZgci2",email: "Wkdmkad@gmail.com", password:"123456")).tabItem{
                    Image(systemName: "text.bubble.fill")
                    Text("Chat")
                }.tag(1)
                SalePage().tabItem{
                    Image(systemName: "bag.badge.plus")
                    Text("Sell")
                }.tag(2)
                ProfilePage().tabItem{
                    Image(systemName: "person")
                    Text("Profile")
                }.tag(3)
                SignOutPage().tabItem{
                    Image(systemName: "person")
                    Text("SignOut")
                }.tag(4)
            }else{
                SignInPage(
//                    showAuthView: true
                ).tag(0)
            }
        }
    }
}

struct TabBarPage_Previews: PreviewProvider {
    static var previews: some View {
        TabBarPage()
    }
}
