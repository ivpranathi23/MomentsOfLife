//
//  PersonalDiary+CoreDataProperties.swift
//  MomentsOfLife
//
//  Created by Venkata Pranathi on 21/05/19.
//  Copyright © 2019 Venkata Pranathi. All rights reserved.
//
//

import Foundation
import CoreData


extension PersonalDiary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonalDiary> {
        return NSFetchRequest<PersonalDiary>(entityName: "PersonalDiary")
    }

    @NSManaged public var emotionName: String?
    @NSManaged public var diaryText: String?
    @NSManaged public var diaryDate: NSDate?

}
