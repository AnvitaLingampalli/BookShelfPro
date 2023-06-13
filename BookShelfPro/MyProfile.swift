//
//  MyProfile.swift
//  BookShelfPro
//
//  Created by Anvita Lingampalli on 3/17/23.
//

import SwiftUI

struct MyProfile: View {
//    @Environment(\.managedObjectContext) private var viewContext
//        @FetchRequest(
//            entity: Profile.entity(),
//
//            sortDescriptors: [NSSortDescriptor(keyPath: \Profile.username, ascending: true)],
//                    animation: .default)
//        var items: FetchedResults<Profile>
    
    @State var dataController: coreDataController = coreDataController()
    
    var body: some View {
        let x = dataController.getProfile()
        //var name = x[0].username
        VStack{
            Text("My Profile")
                .font(.largeTitle)
            Spacer()
            HStack{
                Text("Username")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(x[0].username ?? "No data")")
            }.padding()
            HStack{
                Text("Gmail")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(x[0].email ?? "No data")")
            }.padding()
            HStack{
                Text("Birthday")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("\(x[0].birthday ?? "No data")")
            }.padding()
            Spacer()
            HStack{
                Text("My Wishlist")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("10") //using dummy number for this iteration
            }.padding()
            Spacer()
            NavigationLink(destination: mapView(address: "")){
                Text("Find the nearest bookstores")
            }
            .padding()
            .foregroundColor(Color.blue)
            Spacer()
        }
    }
}

struct MyProfile_Previews: PreviewProvider {
    static var previews: some View {
        MyProfile()
    }
}
