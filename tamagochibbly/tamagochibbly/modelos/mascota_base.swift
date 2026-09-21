//
//  mascota_base.swift
//  tamagochibbly
//
//  Created by alumno on 9/21/26.
//

import Foundation

class MascotaVirtual {
    let nombre: String
    private(set) var estadoActual: EstadoMascota = .iniciacion

    private var hambre: Int = 30
    private var energia: Int = 80
    private var felicidad: Int = 70
    private var higiene: Int = 100
    init(nombre: String) {
        self.nombre = nombre
        transitarA(.iniciacion)
    }
