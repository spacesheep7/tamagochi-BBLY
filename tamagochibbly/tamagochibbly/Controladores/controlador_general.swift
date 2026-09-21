//
//  controlador_general.swift
//  tamagochibbly
//
//  Created by alumno on 9/21/26.
//
import Foundation

private func actualizarEstado() {
      if estadoActual == .muerto { return }
      // muerte por negligencia extrema
      if hambre >= 100 || energia <= 0 || felicidad <= 0 {
          transitarA(.muerto)
          return
      }
      // Necesidades criticas
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
      guard estadoActual != nuevoEstado else { return }
      estadoActual = nuevoEstado
      switch estadoActual {
      case .iniciacion:
          print("\n ¡Bienvenido al mundo, \(nombre)! Tu aventura comienza ahora.")
          actualizarEstado() // Transiciona inmediatamente fuera de iniciación
      case .neutro:
          print("\n🙂 \(nombre) está tranquila contemplando el ambiente.")
      case .hambriento:
          print("\n🍔 \(nombre) tiene mucha hambre. Suenan sus tripas.")
      case .cansado:
          print("\n😴 \(nombre) tiene los ojos pesados y necesita dormir esta cansadita.")
      case .jugueton:
          print("\n🎾 \(nombre) está llena de energía y quiere jugar.")
      case .triste:
          print("\n😢 \(nombre) se siente desatendida le ahce falta un bañito.")
      case .muerto:
          print("\n Lamentablemente, \(nombre) ha fallecido... Fin del juego.")
      }
  }
