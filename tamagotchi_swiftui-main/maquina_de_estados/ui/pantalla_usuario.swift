//
//  pantalla_usuario.swift
//  maquina_de_estados
//
//  Created by Jadzia Galletas on 07/09/26.
//
import SwiftUI

struct PantallaInicial: View {
    @Environment(ControladorGeneral.self) var controlador_tamagotchi
    
    @State var nombre_nuevo = ""
    
    var body: some View {
        Text("Su Estado: \(controlador_tamagotchi.estado)")
        
        
        
        MascotaEstado()
        
       
        
        TextField("place holder: Nombre nuevo de tu tamagotchi", text: $nombre_nuevo)
        Button("cambiar nombre"){
            controlador_tamagotchi.cambiar_nombre(nombre_nuevo)
        }
        
        HStack{
            Button("Juega con el"){
                controlador_tamagotchi.entretener()
            }
            
            Spacer()
            
            Button("Resucitar") {
                // controlador_tamagotchi.revivir()
            }
        }
        
        Button("Actualizar tamagotchi"){
            controlador_tamagotchi.actualizar_medidores()
        }
        
        Button("Alimentar"){
            controlador_tamagotchi.alimentar()
        }
        .buttonStyle(.glass)
        
        Button("Darle un sape"){
            let comando = ComandoTamagotchi.darle_un_sape
            
            controlador_tamagotchi.procesar_comando(comando)
        }
        
        Button{
            controlador_tamagotchi.cambiar_nombre("lucas")
        }
    label: {
        
        VistaJeep( texto: "cambiarnombre")
            
        }
    .frame(height:50)
    }
}

#Preview {
    PantallaInicial()
        .environment(ControladorGeneral())
}


