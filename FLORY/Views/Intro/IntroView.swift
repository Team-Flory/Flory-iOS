//
//  IntroView.swift
//  FLORY
//
//  Created by gourderased on 2023/10/08.
//

import SwiftUI

struct IntroView: View {
    
    let images = ["IntroImage1", "IntroImage2", "IntroImage3", "IntroImage4"]
    let texts = ["가족, 연인, 친구에게\n꽃다발을 선물하려는 당신",
                 "하지만 금새 시들고 버려진 후\n잊혀진 꽃다발이 아쉽지 않으신가요?",
                 "선물하는 꽃다발의 아름다움이\n영원히 간직되기를\n원하시지 않으신가요?",
                 "이제는 NFT와 함께하는\n꽃 선물로 영원한 추억을 가장 소중한 분들께 전하세요."
    ]
    
    //배열 인덱스
    @State private var currentIndex = 0
    
    //로그인 뷰로 넘어가는 상태 변수
    @Binding var showLoginView: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Group{
                        Spacer()
                        Spacer()
                    }
                    HStack{
                        Image(images[currentIndex])
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(height: UIScreen.main.bounds.height * 0.4)
                    }
                    Group{
                        Spacer()
                        Spacer()
                        Spacer()
                        
                    }
                    HStack{
                        Spacer()
                        Text(texts[currentIndex])
                            .font(.system(size: 20, weight: .bold))
                            .multilineTextAlignment(.center)
                            
                        Spacer()
                    }
                    Group{
                        Spacer()
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        //버튼
                        Button(action: {
                            //마지막 페이지가 아닌 경우
                            if currentIndex < images.count - 1 {
                                currentIndex += 1
                            }
                            else {
                                self.showLoginView = true
                            }
                        }) {
                            Text(currentIndex == images.count - 1 ? "선물하러 가기" : "다음")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color("MainColor"))
                                .cornerRadius(20)
                        }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    Spacer()
                    //네비게이션바 숨김
                }.navigationBarHidden(true)
                
            }
        }
    }
}
    
struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(showLoginView: .constant(false))
    }
}
