//
//  DataService.swift
//  Cookapp
//
//  Created by Juan Carlos Guzman R on 2/5/24.
//

import Foundation

class DataService {
    static func cargarRecetas() -> [Recipe]? {
        guard let url = Bundle.main.url(forResource: "dataPrueba", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("❌ No se pudo cargar el archivo JSON")
            return nil // Asegurarse de que esta parte del código puede retornar nil si es necesario
        }

        let decoder = JSONDecoder()
        do {
            let recetas = try decoder.decode([Recipe].self, from: data) // Cambio para decodificar un array de Receta
            return recetas
        } catch {
            print("❌ Error al decodificar Receta: \(error)")
            return nil
        }
    }
}
