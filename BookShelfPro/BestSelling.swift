//
//  BestSelling.swift
//  BookShelfPro
//
//  Created by Anvita Lingampalli on 4/20/23.
//

import SwiftUI

struct booksdata: Decodable
{
    let results : Result
    //let num_results : Int
    
}

struct Result : Decodable{
    let bestsellers_date:String
    let published_date:String
    let published_date_description: String
//    let previous_published_date:String
//    let next_published_date:String
    let lists:[list]
}

struct list : Decodable{
    //let list_id:String
    let list_name:String
    let display_name:String
    let books: [book]
}

struct book : Decodable
{
    //let id:UUID
    let author:String
    let book_image:String
    let description:String
    let title:String
    let rank: Int16
}

struct BestSelling: View {
    @State private var books = [book]()
    var body: some View {
        NavigationView{
            List{
                ForEach(books, id: \.author) { item in
                    NavigationLink(destination:DetailView(bookImage: item.book_image, bookAuthor: item.author, bookRank: item.rank, bookDescription: item.description, bookTitle: item.title, isFav: false)){
                        HStack() {
                                AsyncImage(url: URL(string: item.book_image)){image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 130, height: 130)

                                Text(item.title) //add book title
                                
                        }
                    }
                }
            }.navigationTitle("Best Selling Books")
            .onAppear(perform: getJsonData)
        }
    }
    
    func getJsonData(){
        
        let urlAsString = "https://api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key=ih3BUZAiekfQ5pFgqMrdymkuDA1jfJes"
        
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            var err: NSError?
            
            do {
                let decodedData = try JSONDecoder().decode(booksdata.self, from: data!)
                
                print("books: \(decodedData)")
            
                books = decodedData.results.lists[0].books
            
                
                
                
            } catch {
                print("error: \(error)")
            }
        })
        jsonQuery.resume()
    }
}

struct BestSelling_Previews: PreviewProvider {
    static var previews: some View {
        BestSelling()
    }
}
