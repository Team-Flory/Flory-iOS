import SwiftUI

struct NoticesView: View {
    // 로컬에 저장된 샘플 데이터
    let notices = [
        ("공지사항 제목 1", "공지사항 소제목 1..."),
        ("공지사항 제목 2", "공지사항 소제목 2..."),
        ("공지사항 제목 2", "공지사항 소제목 2..."),
        ("공지사항 제목 2", "공지사항 소제목 2..."),
        ("공지사항 제목 2", "공지사항 소제목 2..."),
    ]
    
    var body: some View {
        VStack{

            List {
                ForEach(notices, id: \.0) { title, subtitle in
                    NavigationLink(destination: NoticeDetailView(title: title, content: subtitle)) {
                        VStack(alignment: .leading) {
                            Text(title)
                                .font(.headline)
                            Text(subtitle)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding(.vertical, 15)
                    }
                }
            }
            
            
        }.navigationTitle("공지사항")
           
        
    }
}

struct NoticeDetailView: View {
    var title: String
    var content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
                .font(.largeTitle)
            Text(content)
                .font(.body)
        }
        .padding()
        .navigationTitle("공지사항 상세")
    }
}

struct NoticesView_Previews: PreviewProvider {
    static var previews: some View {
        NoticesView()
    }
}
