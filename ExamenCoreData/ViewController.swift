//
//  ViewController.swift
//  ExamenCoreData
//
//  Created by DAM on 23/3/18.
//  Copyright © 2018 DAM. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var asignatura: UITextField!
    @IBOutlet weak var nota: UITextField!
    @IBOutlet weak var error: UILabel!
    
    var arr:[String] = [];
    
    var array:[Asignatura] = []
    
    var asignaturaFunctions:Asignatura = Asignatura();
    
    var managedContext:NSManagedObjectContext!
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    @IBAction func save(_ sender: Any) {
        
        if nota.text != "" && asignatura.text != "" {
            
            let numbersRange = nota.text?.rangeOfCharacter(from: .decimalDigits)
            
            if numbersRange != nil {
                let notaValor:Int = Int(nota.text!)!
                
                if notaValor > 0 && notaValor < 11 {
                    asignaturaFunctions.insert(nombre: asignatura.text!, nota: Int(nota.text!)!, managedContext: managedContext)
                    print("ce guarda")
                    error.isHidden = true
                }else{
                    error.text = "la nota no puede ser inferior a 0 ni mayor que 10"
                    error.isHidden = false
                }
            }else{
                error.text = "Nota solo pueden tener numeros numericos"
                error.isHidden = false
            }
        }else{
            error.text = "Los campos no pueden estar vacios"
            error.isHidden = false
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = UITableViewCell(style: UITableViewCellStyle.value2, reuseIdentifier: "cel")
        
        celda.textLabel?.text = array[indexPath.row].nombre
        
        let nota:String = String(array[indexPath.row].nota)
        
        celda.detailTextLabel?.text = nota
        
        return celda
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        managedContext = appDelegate?.persistentContainer.viewContext
        
        var datos = asignaturaFunctions.getAll(managedContext: managedContext)!
        
        if datos.count != 0 {
            array = datos;
        }
    }

}

