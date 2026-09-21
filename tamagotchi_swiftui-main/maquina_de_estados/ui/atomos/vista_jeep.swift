//
//  vista_jeep.swift
//  maquina_de_estados
//
//  Created by alumno on 9/21/26.
//

import SwiftUI

struct VistaJeep: View {
    var texto: String
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundStyle(Color.gray)
            
            HStack
            {
                Circle()
                    .foregroundStyle(Color.pink)
                Text(texto)
               
                Circle()
                        .foregroundStyle(Color.pink)
            }
        }
        .frame(height: 30)
        
    }
}

#Preview {
    VistaJeep(texto: "Placeholder")
}
