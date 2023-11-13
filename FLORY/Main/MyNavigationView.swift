import SwiftUI
import UIKit

//이미지 출처 : <a href="https://www.flaticon.com/kr/free-icons/" title="꽃 아이콘">꽃 아이콘  제작자: Vectors Market - Flaticon</a>

struct MyNavigationView : View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "MainColor")
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 20) {
                // 상단 제작중 뷰
                NavigationLink(destination: NoticesView()) {
                    HStack {
                        Image("MainFlower")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 50)
                        
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("꽃다발을 \n제작하고 있어요 \(sharedData.memberId ?? -1)")
                                .font(.system(size: 18))
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                            Text("10월 10일 김준식님께 전달 예정")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.643, green: 0.643, blue: 0.643))
                        }
                        Spacer()
                    }
                }
                .frame(width:310, height: 90)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("BorderColor"), lineWidth: 2))
                
                // 메인 뷰 - 첫번째 줄
                HStack(spacing: 20) {
                    MainButtonView(destination: FlowerListView(), buttonText:
                    "  꽃다발\n   주문하기", imageName: "Flower1")
                    
                    MainButtonView(destination: FlowerListView(), buttonText:
                    "  NFT\n   선물함", imageName: "Flower2")
                }
                
                // 메인 뷰 - 두번째 줄
                HStack(spacing: 20) {
                    MainButtonView(destination: ChatIntroView(), buttonText:
                    " 꽃다발\n    추천받기", imageName: "Flower3")
                    MainButtonView(destination: AnniversaryManagementView(), buttonText: "  기념일\n관리", imageName: "Flower4")
                }
                
                // 공지사항 뷰
                NavigationLink(destination: NoticesView()) {
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("FLORY 이야기")
                                .font(.system(size: 18))
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                            Text("공지사항을 들어보세요")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .foregroundColor(Color(red: 0.643, green: 0.643, blue: 0.643))
                        }
                        Spacer()
                        Image("Megaphone")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 70, height: 40)
                    }
                }
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(Color("BorderColor"), lineWidth: 2))
            }
            .frame(width:340, height:90)
            .navigationTitle("FLORY")
        }
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView().environmentObject(SharedData())
    }
}
