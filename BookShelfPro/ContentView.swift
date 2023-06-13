//
//  ContentView.swift
//  BookShelfPro
//
//  Created by Anvita Lingampalli on 3/17/23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                Text("BookShelf Pro!")
                    .font(.largeTitle)
                    .foregroundColor(Color.pink)
                
                Text("The favorite online book store")
                    .font(.headline)
                    .foregroundColor(Color.pink)
                Spacer()
                NavigationLink(destination: createProfile()){
                    Text("Create Profile")
                }
                .padding()
                .background(Color.white)
                .foregroundColor(Color.black)
                .cornerRadius(10)
                Image("books")
                    .resizable()
                    .frame(height: 400)
                Spacer()
                
                HStack{
                    Spacer()
                    NavigationLink(destination: wishList()){
                        Text("My Library")
                    }
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(Color.pink)
                    .cornerRadius(10)
                    Spacer()
                }
                
    
                HStack{
                    Spacer()
                    NavigationLink(destination: MyProfile()){
                        Text("My Profile          ")
                    }
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    Spacer()
                    NavigationLink(destination: BestSelling()){
                        Text("Go to BookShelf")
                    }
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
                    Spacer()
                }
                
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
