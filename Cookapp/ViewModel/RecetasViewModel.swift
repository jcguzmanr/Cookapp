//
//  RecetasViewModel.swift
//  Cookapp
//
//  Created by Juan Carlos Guzman R on 2/5/24.
//

import Foundation

class RecetasViewModel: ObservableObject {
    @Published var recetas: [Recipe] = []

    func cargarRecetasDesdeJSON() {
        print("📍 Antes de cargar recetas")
        if let recetasCargadas = DataService.cargarRecetas() {
            self.recetas = recetasCargadas
            print("📚 Recetas cargadas: \(recetasCargadas.count)")
        } else {
            print("❗️ No se pudieron cargar las recetas.")
        }
    }
}
