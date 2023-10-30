import Foundation
class FlowerDetailViewModel: ObservableObject {
    @Published var flower: FlowerDetail?
    @Published var isError: Bool = false

    func fetchFlowerDetail() {
        let urlString = "http://43.201.221.221:8080/flowers/detail?flowerId=1"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Failed to fetch data")
                DispatchQueue.main.async {
                    self.isError = true
                }
                return
            }

            do {
                let response = try JSONDecoder().decode(FlowerAPIResponse.self, from: data)
                DispatchQueue.main.async {
                    self.flower = response.result
                }
            } catch {
                print("Failed to decode JSON: \(error)")
                DispatchQueue.main.async {
                    self.isError = true
                }
            }
        }.resume()
    }
}

struct FlowerAPIResponse: Decodable {
    let isSuccess: Bool
    let code: String
    let message: String
    let result: FlowerDetail
}
