//
//  DataStore.swift
//  SlapChat
//
//  Created by Ian Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData

class DataStore {
    
    static let sharedInstance = DataStore()

    private init() {}
    

  var context : NSManagedObjectContext {
    return persistentContainer.viewContext
  }

  var messages = [Message]()

  func storeMessage( content: String, date: NSDate) {
    let message = Message(context: context)
    message.content = content
    message.createdAt = date
    try! context.save()

  }


  func fetchData() {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Message")
    var messages = try! context.fetch(fetchRequest) as! [Message]
    messages.sort(by: { ($0.createdAt as! Date).compare($1.createdAt as! Date) == ComparisonResult.orderedAscending})
    self.messages = messages

  }

  func delete(message: Message) {
    context.delete(message)
    try! context.save()
  }


  lazy var persistentContainer: NSPersistentContainer = {

    let container = NSPersistentContainer(name: "SlapChat")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {

        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()

  // MARK: - Core Data Saving support

  func saveContext () {
    let context = persistentContainer.viewContext
    if context.hasChanges {
      do {
        try context.save()
      } catch {

        let nserror = error as NSError
        fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
      }
    }
  }
    
}
