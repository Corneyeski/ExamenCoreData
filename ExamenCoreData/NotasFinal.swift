//
//  NotasFinal.swift
//  ExamenCoreData
//
//  Created by DAM on 23/3/18.
//  Copyright © 2018 DAM. All rights reserved.
//

import Foundation

class NotasFinal {
    
    var asignatura:String
    var notas:[Int]
    
    init() {
        asignatura = ""
        notas = []
    }
    
    init(asignatura:String, notas:Int...) {
        self.asignatura = asignatura
        self.notas = notas
    }
}
