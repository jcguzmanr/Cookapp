import Foundation

struct RecipeIngredient: Codable, Identifiable {
    var id: UUID
    let quantity: String
    let normalizedQuantity: String
    let scale: String
    let name: String
    let basicIngredient: String
    let notes: String
    
    // Custom initializer to ensure each ingredient has a unique UUID when decoding
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        quantity = try container.decode(String.self, forKey: .quantity)
        normalizedQuantity = try container.decode(String.self, forKey: .normalizedQuantity)
        scale = try container.decode(String.self, forKey: .scale)
        name = try container.decode(String.self, forKey: .name)
        basicIngredient = try container.decode(String.self, forKey: .basicIngredient)
        notes = try container.decode(String.self, forKey: .notes)
        id = UUID()
    }
    
    // Standard initializer for manual creation
    init(id: UUID = UUID(), quantity: String, normalizedQuantity: String, scale: String, name: String, basicIngredient: String, notes: String) {
        self.id = id
        self.quantity = quantity
        self.normalizedQuantity = normalizedQuantity
        self.scale = scale
        self.name = name
        self.basicIngredient = basicIngredient
        self.notes = notes
    }
    
    private enum CodingKeys: String, CodingKey {
        case quantity, normalizedQuantity, scale, name, basicIngredient, notes
    }
    
    // Static property for dummy data
    static let dummyData = RecipeIngredient(
        quantity: "2",
        normalizedQuantity: "2",
        scale: "unidades",
        name: "dientes de ajo",
        basicIngredient: "ajo",
        notes: "Picar finamente"
    )
}
