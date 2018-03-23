//
//  Asignatura+CoreDataClass.swift
//  ExamenCoreData
//
//  Created by DAM on 23/3/18.
//  Copyright © 2018 DAM. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Asignatura)
public class Asignatura: NSManagedObject {

    var managedContext:NSManagedObjectContext!
    
    func insert(nombre:String, nota:Int, managedContext:NSManagedObjectContext) -> Bool{
        
        let asignaturaEntity = NSEntityDescription.entity(forEntityName: "Asignatura", in: managedContext)
        
        let newAsignatura = Asignatura(entity: asignaturaEntity!, insertInto: managedContext)
        
        newAsignatura.nombre = nombre
        newAsignatura.nota = Int16(nota)
        
        
        do{
            try! managedContext.save()
            return true
            
        }catch let error as NSError {
            print("Error al salvar la nota \(error)")
            return false
        }
        return false
    }
    
    func getAll(managedContext:NSManagedObjectContext) -> [Asignatura]? {
        
        let fetchRequest = NSFetchRequest<Asignatura>(entityName: "Asignatura")
        
        do{
            let result = try! managedContext.fetch(fetchRequest) as [Asignatura]
            
            if result.count > 0 {
                return result
            }else {
                return result
            }
            
        }catch let error as NSError {
            print("Error al obtener los datos \(error)")
            return nil
        }
    }
    
}
