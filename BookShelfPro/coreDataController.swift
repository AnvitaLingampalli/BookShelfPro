//
//  coreDataController.swift
//  Lab6CoreData
//
//  Created by Anvita Lingampalli on 18/04/23.
//

import Foundation
import CoreData

class coreDataController : ObservableObject
{
    @Published var profileData:[Profile] = [Profile]()
    @Published var bookData:[Book] = [Book]()
    
    let persistentContainer:NSPersistentContainer
    
    init()
    {
        persistentContainer = NSPersistentContainer(name: "BookShelfPro")
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error{
                fatalError("cannot load data \(error.localizedDescription)")
            }
        }
        
        profileData = getProfile()
        bookData = getBook()
    }
    
    func saveProfile(username: String, email: String, bday:String)
    {
        let profile = Profile(context: persistentContainer.viewContext)
        profile.username = username
        profile.email = email
        profile.birthday = bday
        
        do {
            //print("saving")
            try persistentContainer.viewContext.save()
            //profileData = getProfile()
        } catch{
            print("failed to save \(error)")
        }
    }
    
    func saveBook(title:String, rank: Int16, image:String, desc:String, author:String, isFav:Bool)
    {
        let book = Book(context: persistentContainer.viewContext)
        book.title = title
        book.rank = rank
        book.image = image
        book.desc = desc
        book.author = author
        book.isFav = isFav
        
        do {
            //print("saving")
            try persistentContainer.viewContext.save()
            bookData = getBook()
        } catch{
            print("failed to save \(error)")
        }
    }
    
    func deleteProfile(profile: Profile)
    {
        persistentContainer.viewContext.delete(profile)
        do {
            //print("saving")
            try persistentContainer.viewContext.save()
            //LanData = getLanguages()
        } catch{
            print("failed to save \(error)")
        }
    }
    
    func deleteBook(title:String, rank: Int16, image:String, desc:String, author:String, isFav:Bool)
    {
        let book = Book(context: persistentContainer.viewContext)
        book.title = title
        book.rank = rank
        book.image = image
        book.desc = desc
        book.author = author
        book.isFav = isFav
        
        persistentContainer.viewContext.delete(book)
        do {
            //print("saving")
            try persistentContainer.viewContext.save()
            //LanData = getLanguages()
        } catch{
            print("failed to save \(error)")
        }
    }
    
   
    
    func getProfile() -> [Profile]
    {
        let fetchRequest: NSFetchRequest<Profile> = Profile.fetchRequest()
        do {
            let x = try persistentContainer.viewContext.fetch(fetchRequest)
            /*print(x.count)
            print(x[0].name)*/
            return x
        }catch{
            return []
        }
    }
    
    func getBook() -> [Book]
    {
        let fetchRequest: NSFetchRequest<Book> = Book.fetchRequest()
        do {
            let x = try persistentContainer.viewContext.fetch(fetchRequest)
            /*print(x.count)
            print(x[0].name)*/
            return x
        }catch{
            return []
        }
    }
}
