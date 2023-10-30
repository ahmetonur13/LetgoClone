//
//  SaleDetailView.swift
//  LetgoClone
//
//  Created by Ahmet Onur on 26.10.2023.
//

import SwiftUI

struct SaleDetailView: View {
    @ObservedObject var salePage = SaleStore()
    var index : Int
    var body: some View {
        VStack{
            Text(salePage.ilanArray[index].ilanDetail)
        }
    }
}

struct SaleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SaleDetailView(index: 0)
    }
}
