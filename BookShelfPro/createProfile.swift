//
//  createProfile.swift
//  BookShelfPro
//
//  Created by Anvita Lingampalli on 3/17/23.
//

import SwiftUI

struct createProfile: View {
    @State var username: String = ""
    @State var gmail: String = ""
    @State var bday: String = ""
    @State var dataController: coreDataController = coreDataController()
    @State private var showAlert = false
    
    var body: some View {
        VStack{
            Text("Create Profile")
                .font(.largeTitle)
            
            Spacer()
            
            TextField("Username", text: $username).padding()
                .padding(4)
                .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                .padding()
            
            TextField("Gmail", text: $gmail).padding()
                .padding(4)
                .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                .padding()
            
            TextField("Birthday", text: $bday).padding()
                .padding(4)
                .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                .padding()
            
            Spacer()
            
            Button("Create Profile", action: {
                dataController.saveProfile(username: username, email: gmail, bday:bday)
                showAlert = true
            })
            .padding()
            .background(Color.pink)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .alert("Profile created!", isPresented: $showAlert){
                Button("OK", role: .cancel){}
            }
            
            Spacer()
            
        }
    }
}

struct createProfile_Previews: PreviewProvider {
    static var previews: some View {
        createProfile()
    }
}
