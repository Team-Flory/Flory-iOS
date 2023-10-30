import Combine
import Foundation

class FlowerListViewModel: ObservableObject {
    @Published var flowers: [Flower] = []
    @Published var searchText: String = ""
    
    var cancellables = Set<AnyCancellable>()

    init() {
        fetchFlowers()
    }

    func fetchFlowers() {
        guard let url = URL(string: "http://43.201.221.221:8080/flowers") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: FlowerResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error fetching flowers: \(error)")
                }
            }, receiveValue: { response in
                self.flowers = response.result
            })
            .store(in: &cancellables)
    }
}
