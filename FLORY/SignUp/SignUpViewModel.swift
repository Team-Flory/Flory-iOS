import Foundation
import Combine

struct ServerResponse: Codable {
    let isSuccess: Bool
    let code: String
    let message: String
}

class SignUpViewModel: ObservableObject {
    func signUp(user: User, completion: @escaping (Bool, String?) -> Void) {
        guard let jsonData = try? JSONEncoder().encode(user) else {
            print("Error: Trying to convert user to JSON data")
            completion(false, "Failed to encode user data.")
            return
        }
        
        let url = URL(string: "http://43.201.221.221:8080/members")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json;charset=UTF-8", forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error occurred: \(error.localizedDescription)")
                    completion(false, error.localizedDescription)
                    return
                }
                
                if let data = data, let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        completion(true, nil)
                    } else {
                        do {
                            let serverResponse = try JSONDecoder().decode(ServerResponse.self, from: data)
                            completion(false, serverResponse.message)
                        } catch {
                            completion(false, "Failed to parse server response")
                        }
                    }
                } else {
                    completion(false, "Unknown error")
                }
            }
        }
        task.resume()
    }
}
