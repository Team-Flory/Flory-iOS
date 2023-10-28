import SwiftUI

struct TestView: View {
    @State private var data: ResponseData?
    @State private var isLoadingOrError: Bool = true

    var body: some View {
        VStack {
            if isLoadingOrError {
                Text("Loading or Error...")
            } else {
                VStack {
                    Text(data?.title ?? "No title")
                        .font(.title)
                    Text(data?.content ?? "No content")
                        .font(.body)
                }
            }
        }
        .onAppear {
            fetchData()
        }
    }

    func fetchData() {
        guard let url = URL(string: "http://43.201.221.221:8080/test") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            if let data = data, let responseData = try? JSONDecoder().decode(ResponseData.self, from: data) {
                DispatchQueue.main.async {
                    self.data = responseData
                    isLoadingOrError = false
                }
            }
        }.resume()
    }
}

struct ResponseData: Decodable {
    var title: String
    var content: String
}

struct TestView_previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
