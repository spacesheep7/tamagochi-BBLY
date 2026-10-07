//
//  mascota_view.swift
//  tagochiestesi
//
//  Created by alumno on 10/7/26.
//

import SwiftUI
 
struct MascotaView: View {
    @StateObject private var mascota = MascotaVirtual(nombre: "Beily")
 
    var body: some View {
        VStack(spacing: 20) {
            // Cabecera con Avatar y Estado
            VStack(spacing: 8) {
                //Text(mascota.estadoActual.emoji)
                  //  .font(.system(size: 80))
                Image(mascota.estadoActual.foto)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 400)
                Text(mascota.nombre)
                    .font(.largeTitle)
                    .bold()
                Text("Estado: \(mascota.estadoActual.rawValue)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
 
            // Mensaje de estado
            Text(mascota.mensajeEstado)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .font(.body)
                .frame(height: 50)
 
            // Barras de estadísticas agregado por gemini
            VStack(spacing: 12) {
                StatRow(titulo: "Hambre", valor: mascota.hambre, color: .alimentar)
                StatRow(titulo: "Energía", valor: mascota.energia, color: .dormir)
                StatRow(titulo: "Felicidad", valor: mascota.felicidad, color: .jugar)
                StatRow(titulo: "Higiene", valor: mascota.higiene, color: .banar)
            }
            .padding(.horizontal)
 
            Spacer()
 
            // Botones de acción
            
            HStack(spacing: 15) {
                Button(action: { mascota.alimentar() }) {
                    Label("Alimentar", systemImage: "fork.knife")
                }
                .buttonStyle(.borderedProminent)
                .tint(.alimentar)
 
                Button(action: { mascota.jugar() }) {
                    Label("Jugar", systemImage: "sportscourt")
                }
                .buttonStyle(.borderedProminent)
                .tint(.jugar)
 
                Button(action: { mascota.banar() }) {
                    Label("Bañar", systemImage: "drop.fill")
                }
                .buttonStyle(.borderedProminent)
                .tint(.banar)
 
                Button(action: { mascota.dormir() }) {
                    Label("Dormir", systemImage: "moon.fill")
                }
                .buttonStyle(.borderedProminent)
                .tint(.dormir)
                
                Button("reiniciar")
            }
            .disabled(mascota.estadoActual == .muerto)
            .padding(.bottom)
        }
        .padding()
    }
}
 
// Subvista para las barras de progreso
struct StatRow: View {
    let titulo: String
    let valor: Int
    let color: Color
 
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(titulo)
                    .font(.caption)
                    .bold()
                Spacer()
                Text("\(valor)/100")
                    .font(.caption)
            }
            ProgressView(value: Double(valor), total: 100)
                .tint(color)
        }
    }
}
 

#Preview {
    MascotaView()
}
