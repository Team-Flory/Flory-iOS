import Foundation
import Combine

class PaymentViewModel: ObservableObject {
    // 여기에 필요한 @Published 변수들을 정의할 수 있습니다.
    
    func sendPayment(memberId: Int, receiverNickname: String, flowerId: Int, receiveDate: String) {
        guard let url = URL(string: "http://43.201.221.221:8080/purchases") else { return }

        let paymentData = PaymentData(memberId: memberId, receiverNickname: receiverNickname, flowerId: flowerId, receiveDate: receiveDate)

        guard let encodedData = try? JSONEncoder().encode(paymentData) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = encodedData

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error sending payment data: \(error)")
                return
            }
            // 여기에서 응답 처리
        }.resume()
    }
}
