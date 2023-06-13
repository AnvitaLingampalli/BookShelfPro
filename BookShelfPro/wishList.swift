//
//  wishList.swift
//  BookShelfPro
//
//  Created by Anvita Lingampalli on 4/22/23.
//

import SwiftUI

struct wishList: View {
    @State var dataController: coreDataController = coreDataController()
    var body: some View {
        let books = dataController.getBook()
        NavigationView{
            List{
                ForEach(books, id: \.author){ item in
                    HStack() {
                        AsyncImage(url: URL(string: item.image ?? "")){image in
                                image
                                    .resizable()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 130, height: 130)

                        Text(item.title ?? "") //add book title
                            
                    }
                }
            }.navigationTitle("My Library")
        }
    }
}

struct wishList_Previews: PreviewProvider {
    static var previews: some View {
        wishList()
    }
}
