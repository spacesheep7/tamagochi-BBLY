//
//  mascota_estado_pantalla.swift
//  maquina_de_estados
//
//  Created by Jadzia Galletas on 11/09/26.
//
import SwiftUI

struct MascotaEstado: View {
    @Environment(ControladorGeneral.self) var mascota
    
    var body: some View {
        switch(mascota.estado){
            case .Neutro:
                Rectangle()
                    .foregroundStyle(Color.gray)
                    Text("\n🙂 está tranquila contemplando el ambiente.")
            case .Hambriento:
                Rectangle()
                    .foregroundStyle(Color.orange)
                    Text("\n😋 está hambriento y quiere comer")
                
            case .Inanición:
                Rectangle()
                    .foregroundStyle(Color.red)
                    Text("Bienvenido al mundo chiquitin")
            case .Triste:
                Rectangle()
                    .foregroundStyle(Color.blue)
                    Text("\n😢 está triste y quiere jugar")
            case .Cansado:
                Rectangle()
                    .foregroundStyle(Color.yellow)
                    Text("\n😴 está cansado y quiere descansar")
            
            case .Muerte:
                Text("QUE MAS QUIERES SI ESTA MUERTO")
                    .fontWidth(.expanded)
                    .fontWeight(.heavy)
                
            default:
                Text("NO se que paso")
        }
        
    }
}


#Preview {
    MascotaEstado()
        .environment(ControladorGeneral())
}
