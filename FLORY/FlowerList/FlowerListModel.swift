struct FlowerResponse: Decodable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: [Flower]
}

struct Flower: Identifiable, Decodable {
    let flowerId: Int
    let name: String
    let description: String
    let price: Int

    var id: Int { return flowerId }  // Identifiable을 준수하기 위해 id를 추가
}
