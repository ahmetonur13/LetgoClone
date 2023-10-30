//
//  SignOutPage.swift
//  LetgoClone
//
//  Created by Ahmet Onur on 28.10.2023.
//

import SwiftUI
import Firebase
struct SignOutPage: View {
    @EnvironmentObject var session : SessionManager
//    let auth = Auth.auth()
    var body: some View {
            VStack{
                Text(session.loggedUser?.email ?? "")
                Button("Sign Out"){
                    session.logout()
                }
        }
    }
    struct SignOutPage_Previews: PreviewProvider {
        static var previews: some View {
            SignOutPage()
        }
    }
}
