// LoginViewModel.swift
import Foundation
import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var memberId: Int?
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    var cancellables = Set<AnyCancellable>()
    
    // 로그인 성공 시 호출될 클로저를 추가합니다.
    var onLoginSuccess: (() -> Void)?
    
    func login(with email: String, password: String) {
        guard let url = URL(string: "http://43.201.221.221:8080/members/login") else { return }
        
        let request = LoginRequest(email: email, password: password)
        var requestUrl = URLRequest(url: url)
        requestUrl.httpMethod = "POST"
        requestUrl.setValue("application/json;charset=UTF-8", forHTTPHeaderField: "Content-Type")
        
        do {
            requestUrl.httpBody = try JSONEncoder().encode(request)
        } catch {
            print("Error encoding login request: \(error)")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: requestUrl)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: LoginResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error with login request: \(error)")
                    self.alertMessage = "로그인 중 문제가 발생했습니다."
                    self.showAlert = true
                }
            }, receiveValue: { loginResponse in
                if loginResponse.isSuccess {
                    self.memberId = loginResponse.result.memberId
                    // 로그인 성공 시 onLoginSuccess 클로저를 호출합니다.
                    self.onLoginSuccess?()
                } else {
                    self.alertMessage = loginResponse.message
                    self.showAlert = true
                }
            })
            .store(in: &cancellables)
    }
}
