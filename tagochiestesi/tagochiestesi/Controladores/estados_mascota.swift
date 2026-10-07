//
//  estados_mascota.swift
//  tagochiestesi
//
//  Created by alumno on 10/7/26.
//

import Foundation
 
enum EstadoMascota: String {
    case iniciacion = "Naciendo"
    case neutro = "Tranquilo"
    case hambriento = "Hambriento"
    case cansado = "Cansado"
    case jugueton = "Juguetón"
    case triste = "Triste"
    case muerto = "Fallecido"
    
    var foto: String {
        switch self {
        case .iniciacion: return "neutro"
        case .neutro: return "neutro"
        case .hambriento: return "cansada"
        case .cansado: return "triste"
        case .jugueton: return "juguetona"
        case .triste: return "sucia"
        case .muerto: return "dormida"
        }
    }
}
