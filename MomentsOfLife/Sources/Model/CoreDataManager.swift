//
//  CoreDataManager.swift
//  GoalsSetting
//
//  Created by Venkata Pranathi on 14/05/19.
//  Copyright © 2019 Venkata Pranathi. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let goalEntity: NSEntityDescription?
    let context: NSManagedObjectContext?
    internal static var sharedInstance = CoreDataManager()
    
    init() {
       context = appDelegate.persistentContainer.viewContext
        goalEntity = NSEntityDescription.entity(forEntityName: "PersonalDiary", in: context!)
    }
    
    func save(emotionName: String, diaryText: String, diaryDate: Date) {
        let goalValues = NSManagedObject(entity: goalEntity!, insertInto: context) as? PersonalDiary
        goalValues?.emotionName = emotionName
        goalValues?.diaryText = diaryText
        goalValues?.diaryDate = diaryDate as NSDate
        
        do {
            try context!.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func fetchData() -> [PersonalDiary]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PersonalDiary")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context!.fetch(request) as? [PersonalDiary]
            return result
            
        } catch {
            print("Failed")
            return nil
        }
    }
    
//    func updateData(nameString: String, value: Float) {
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "PersonalDiary")
//        request.predicate = NSPredicate(format: "name = %@", nameString)
//        do {
//            let result = try context!.fetch(request) as! [PersonalDiary]
//            result[0].percentage = value
//
//            do {
//                try context!.save()
//            } catch let error as NSError {
//                print("Could not save. \(error), \(error.userInfo)")
//            }
//
//        } catch {
//            print("Failed")
//        }
//    }
    
//    func checkAvailability(nameString: String) -> Bool {
//         let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
//        request.predicate = NSPredicate(format: "name = %@", nameString)
//        do {
//            let result = try context!.fetch(request) as! [Goal]
//            if result.count == 0 {
//                return true
//            } else {
//                return false
//            }
//            
//        } catch {
//           print("Failed")
//            return false
//        }
//    }
    
}
