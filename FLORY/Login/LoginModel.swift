import Foundation

struct LoginResponse: Codable {
    var isSuccess: Bool
    var code: String
    var message: String
    var result: LoginResult
}

struct LoginResult: Codable {
    var memberId: Int
}
