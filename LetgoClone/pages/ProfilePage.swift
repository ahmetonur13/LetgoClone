//
//  ProfilePage.swift
//  LetgoClone
//
//  Created by Ahmet Onur on 19.10.2023.
//

import SwiftUI
import Firebase
struct ProfilePage: View {
//    @ObservedObject var userStore = UserStore()
    @ObservedObject var ilanStore = SaleStore()
    @EnvironmentObject var session : SessionManager
    let auth = Auth.auth()
    var body: some View {
        VStack{
//            let currendIndex = session.loggedUser?.email
//            let currentIndexIlan = ilanStore.ilanArray.last?.id
            Text((session.loggedUser?.email)!)
            List{
                ForEach(ilanStore.ilanArray){ ilanlar in
                    if ilanlar.uidForFirebase == session.loggedUser!.uid{
                        Text(ilanlar.ilanTitle)
                    }
                }
            }
            
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
    }
}
