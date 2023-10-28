import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) { message in
                    messageView(message: message)
                }
            }
            HStack {
                TextField("먼저 챗봇에게 인사를 해보세요", text:$viewModel.currentInput)
                Button {
                    viewModel.sendMessage()
                } label: {
                    Text("Send")
                }
            }
        }
        .padding()
        .navigationTitle("추천받기")
    }
        
    
    func messageView(message: Message) -> some View {
        HStack {
            if message.role == .user {Spacer()}
            Text(message.content)
                .padding()
                .background(message.role == .user ? Color("MainColor") : Color.gray.opacity(0.2))
            if message.role == .assistant {Spacer()}
        }
    }
}
