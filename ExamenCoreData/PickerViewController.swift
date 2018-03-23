//
//  PickerViewController.swift
//  ExamenCoreData
//
//  Created by DAM on 23/3/18.
//  Copyright © 2018 DAM. All rights reserved.
//

import UIKit
import CoreData

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    var array:[NotasFinal] = []
    var who = 0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row].asignatura
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        who = row
    }

    var asignaturaFunctions:Asignatura = Asignatura();
    
    var managedContext:NSManagedObjectContext!
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managedContext = appDelegate?.persistentContainer.viewContext
        
        var request = asignaturaFunctions.getAll(managedContext: managedContext)
        
        if request != nil && request?.count != 0{
            for un in request!{
                array.append(NotasFinal(asignatura: un.nombre!, notas: Int(un.nota)))
            }
        }
    }
}
