//
//  MainPage.swift
//  LetgoClone
//
//  Created by Ahmet Onur on 19.10.2023.
//

import SwiftUI

struct MainPage: View {
    @ObservedObject var saleStore = SaleStore()
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach (saleStore.ilanArray){ ilan in
                                let currendIndex = ilan.id
                                    NavigationLink(destination : SaleDetailView(index: currendIndex)){
                                        Text(ilan.ilanTitle)
                                    }
                            }
                        }
            }.padding().navigationTitle("SALES").navigationBarTitleDisplayMode(.inline)
        }
    }
}
struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
