import Foundation
extension ChatView {
    class ViewModel: ObservableObject {
        @Published var messages: [Message] = [Message(id: UUID(), role: .system, content: "You should recommend flowers. If the user greets you, respond with '안녕하세요! 나이대와 기념일 종류를 알려주시면 적절한 꽃을 추천해드려요.' If they tell you the age and the type of anniversary, you should tell them the type and color of flowers that match the input, it's good if you tell me the flower language. If the conversation is not related to flowers, don't continue the conversation. Always answer in Korean."
, createAt: Date())]
        
        @Published var currentInput: String = ""
        
        private let openAIService = OpenAIService()
        
        func sendMessage() {
            let newMessage = Message(id: UUID(), role: .user, content: currentInput, createAt: Date())
            messages.append(newMessage)
            currentInput = ""
            
            Task {
                let response = await openAIService.sendMessage(messages: messages)
                guard let receivedOpenAIMessage = response?.choices.first?.message else {
                    print("Had no received message")
                    return
                }
                let receivedMessage = Message(id: UUID(), role: receivedOpenAIMessage.role, content: receivedOpenAIMessage.content, createAt: Date())
                await MainActor.run {
                    messages.append(receivedMessage)
                }
            }
        }
    }
}

struct Message: Decodable {
    let id : UUID
    let role: SenderRole
    let content: String
    let createAt: Date
}
