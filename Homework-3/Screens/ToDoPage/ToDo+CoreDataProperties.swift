//
//  ToDo+CoreDataProperties.swift
//  Homework-3
//
//  Created by Mehmet Dolasan on 24.09.2022.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var content: String?
    @NSManaged public var status: Bool

}

extension ToDo : Identifiable {

}
