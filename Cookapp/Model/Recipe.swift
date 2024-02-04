import Foundation

struct Recipe: Codable, Identifiable {
    var id = UUID()
    let title: String
    let introduction: Introduction
    let ingredients: [RecipeIngredient]
    let method: [PreparationStep]
    let chefNotes: String
    let servingSuggestions: String
    let extraTip: String
    
    struct Introduction: Codable, Identifiable {
        var id: UUID? = UUID()
        let text: String
        let datos: String
    }
    
    struct PreparationStep: Codable, Identifiable {
        var id: UUID? = UUID()
        let step: Int
        let instruction: String
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case introduction
        case ingredients
        case method
        case chefNotes = "chefs_notes"
        case servingSuggestions = "serving_suggestions"
        case extraTip = "extra_tip"
    }
    
    // Static property for dummy data
    static let dummyData = Recipe(
        title: "Cebiche Criollo",
        introduction: Introduction(text: "En este cebiche podemos utilizar todos los pescados mencionados en el cebiche clásico, pero también podemos usar jurel, caballa, pejerrey, anchoveta, bonito y otros pescados de sabor y carácter.", datos: "Hacemos una leche de tigre licuando diversos ingredientes para obtener un sabor característico."),
        ingredients: [RecipeIngredient.dummyData, RecipeIngredient.dummyData], // Add as many dummy ingredients as needed
        method: [
            PreparationStep(step: 1, instruction: "Licuar los ingredientes para hacer la leche de tigre."),
            PreparationStep(step: 2, instruction: "Colar el licuado y añadirlo al pescado antes de comenzar a exprimir los limones.")
        ],
        chefNotes: "La leche de tigre debe ser fresca para realzar los sabores del cebiche.",
        servingSuggestions: "Servir acompañado de los tradicionales choclo y camote.",
        extraTip: "Utilizar las espinas y cabezas de pescado para hacer un caldo que se puede usar en la preparación del cebiche."
    )
}
