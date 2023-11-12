import SwiftUI
struct MainButtonView<Destination: View>: View {
    var destination: Destination
    var buttonText: String
    var imageName: String
    
    init(destination: Destination, buttonText: String, imageName: String) {
        self.destination = destination
        self.buttonText = buttonText
        self.imageName = imageName
    }
    
    var body: some View {
        VStack{
            NavigationLink(destination: self.destination) {
                ZStack(alignment: .topLeading) {
                    // 텍스트를 왼쪽 상단에 배치
                    Text(buttonText)
                        .font(.system(size: 15))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.black)
                        .padding([.top, .leading]) // 위, 왼쪽 패딩 추가
                    
                    // 이미지를 오른쪽 하단에 배치
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: min(80, 75))
                        .padding([.bottom, .trailing]) // 아래, 오른쪽 패딩 추가
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing) // 오른쪽 하단 정렬
                }
            }
        }
        .frame(width: 160, height: 150)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("BorderColor"), lineWidth: 2))
    }
}
