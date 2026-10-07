//
//  mascota_virtual.swift
//  tagochiestesi
//
//  Created by alumno on 10/7/26.
//

import Foundation
import Combine
 
class MascotaVirtual: ObservableObject {
    let nombre: String
    @Published private(set) var estadoActual: EstadoMascota = .iniciacion
    @Published private(set) var hambre: Int = 30
    @Published private(set) var energia: Int = 80
    @Published private(set) var felicidad: Int = 70
    @Published private(set) var higiene: Int = 100
    @Published var mensajeEstado: String = ""
 
    init(nombre: String) {
        self.nombre = nombre
        transitarA(.iniciacion)
        inicializar()
        
    }
    
    func inicializar(){
        
    }
 
    private func actualizarEstado() {
        if estadoActual == .muerto { return }
 
        if hambre >= 100 || energia <= 0 || felicidad <= 0 {
            transitarA(.muerto)
            return
        }
 
        if hambre >= 70 {
            transitarA(.hambriento)
        } else if energia <= 25 {
            transitarA(.cansado)
        } else if felicidad <= 30 || higiene <= 20 {
            transitarA(.triste)
        } else if felicidad >= 80 && energia >= 50 {
            transitarA(.jugueton)
        } else {
            transitarA(.neutro)
        }
    }
 
    private func transitarA(_ nuevoEstado: EstadoMascota) {
        guard estadoActual != nuevoEstado || nuevoEstado == .iniciacion else { return }
        estadoActual = nuevoEstado
 
        switch estadoActual {
        case .iniciacion:
            mensajeEstado = "¡Bienvenido al mundo, \(nombre)! Tu aventura comienza ahora."
            actualizarEstado()
        case .neutro:
            mensajeEstado = "\(nombre) está tranquila contemplando el ambiente."
        case .hambriento:
            mensajeEstado = "\(nombre) tiene mucha hambre. Suenan sus tripas."
        case .cansado:
            mensajeEstado = "\(nombre) tiene los ojos pesados y necesita dormir."
        case .jugueton:
            mensajeEstado = "\(nombre) está llena de energía y quiere jugar."
        case .triste:
            mensajeEstado = "\(nombre) se siente desatendida, le hace falta un baño."
        case .muerto:
            mensajeEstado = "Lamentablemente, \(nombre) ha fallecido... Fin del juego."
        }
    }
 
    // Acciones
    func alimentar() {
        guard verificarViva() else { return }
        hambre = max(0, hambre - 40)
        energia = min(100, energia + 5)
        higiene = max(0, higiene - 10)
        actualizarEstado()
    }
 
    func jugar() {
        guard verificarViva() else { return }
 
        if estadoActual == .cansado {
            mensajeEstado = "Cuidado, \(nombre) está demasiado cansada para jugar."
            return
        }
 
        felicidad = min(100, felicidad + 35)
        hambre = min(100, hambre + 20)
        energia = max(0, energia - 25)
        higiene = max(0, higiene - 15)
        actualizarEstado()
    }
 
    func banar() {
        guard verificarViva() else { return }
        higiene = 100
        felicidad = min(100, felicidad + 10)
        energia = max(0, energia - 10)
        actualizarEstado()
    }
 
    func dormir() {
        guard verificarViva() else { return }
        energia = min(100, energia + 50)
        hambre = min(100, hambre + 15)
        actualizarEstado()
    }
 
    private func verificarViva() -> Bool {
        if estadoActual == .muerto {
            mensajeEstado = "No puedes realizar acciones. \(nombre) ya no está con nosotros."
            return false
        }
        return true
    }
}
