struct FlowerDetail: Identifiable, Decodable {
    let id: Int
    let name: String
    let description: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case id = "flowerId"
        case name
        case description
        case price
    }
}
