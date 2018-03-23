//
//  Asignatura+CoreDataProperties.swift
//  ExamenCoreData
//
//  Created by DAM on 23/3/18.
//  Copyright © 2018 DAM. All rights reserved.
//
//

import Foundation
import CoreData


extension Asignatura {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Asignatura> {
        return NSFetchRequest<Asignatura>(entityName: "Asignatura")
    }

    @NSManaged public var nombre: String?
    @NSManaged public var nota: Int16

}
