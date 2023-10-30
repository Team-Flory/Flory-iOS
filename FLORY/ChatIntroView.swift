//
//  ChatViewIntro.swift
//  FLORY
//
//  Created by gourderased on 2023/10/26.
//

import SwiftUI

struct ChatIntroView: View {
    var body: some View {
        
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                Group{
                    Spacer()
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text("FLORY AI 도우미")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(Color("MainColor"))
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                Spacer()
                HStack{
                    Text("꽃에 대해 잘 모르셔도 괜찮아요.\n선물 받는 사람의 연령대와 기념일 종류를 말씀해주세요.\n그럼 지피티가 친절하게 선물에 적절한 꽃을 추천해줘요.")
                        .font(.system(size:15))
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.center)
                }
                
                HStack{
                    Image("ChatbotImage")
                        .resizable()
                        .aspectRatio( contentMode: .fit)
                        .frame(height: UIScreen.main.bounds.height * 0.4)
                }
                Group{
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }
                
                Group{
                    Spacer()
                    Spacer()
                }
                
                //버튼
                HStack{
                    Spacer()
                    NavigationLink(destination: ChatView()) {
                        Text("계속")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .background(Color("MainColor"))
                    .cornerRadius(40)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                    .padding()
                    Spacer()
                }
                
                
                
                
                Spacer()
                
            }.navigationTitle("AI 도우미")
            
        }
    }
}

struct ChatViewIntro_Previews: PreviewProvider {
    static var previews: some View {
        ChatIntroView()
    }
}
