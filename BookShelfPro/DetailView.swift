//
//  DetailView.swift
//  BookShelfPro
//
//  Created by Anvita Lingampalli on 4/21/23.
//

import SwiftUI

struct DetailView: View {
    let bookImage: String
    let bookAuthor: String
    let bookRank: Int16
    let bookDescription: String
    let bookTitle: String
    let isFav:Bool
    @State var dataController: coreDataController = coreDataController()
    @State var selected:Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                AsyncImage(url: URL(string: bookImage)){image in
                    image
                        .resizable()
                } placeholder: {
                    Color.gray
                }
                .frame(width: 250, height: 250)
                
                Text(bookTitle).font(.title2)
                Text(bookAuthor).font(.title3)
                Text("Rank: \(bookRank)").font(.title3)
                
                Spacer()
                Text("Description:").font(.headline)
                Text(bookDescription)
                Spacer()
            }
        }.navigationTitle("Book Details")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {

                        self.selected.toggle()
                        if(self.selected == true){
                            dataController.saveBook(title: bookTitle, rank: bookRank, image: bookImage, desc: bookDescription, author: bookAuthor, isFav: self.selected)
                        }
                        else{
                            dataController.deleteBook(title: bookTitle, rank: bookRank, image: bookImage, desc: bookDescription, author: bookAuthor, isFav: self.selected)
                        }
                        
                    } label: {
                        if (self.selected == true || isFav == true ){
                            Image(systemName: "bookmark.fill").foregroundColor(Color.red)
                        }
                        else{
                            Image(systemName: "bookmark").foregroundColor(Color.gray)
                        }
                    }
                }
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(bookImage: "", bookAuthor: "", bookRank: 0, bookDescription: "", bookTitle: "", isFav: false)
    }
}
