//
//  MyNavigationView.swift
//  FLORY
//
//  Created by gourderased on 2023/09/20.
//

import SwiftUI
import UIKit

//이미지 출처 : <a href="https://www.flaticon.com/kr/free-icons/" title="꽃 아이콘">꽃 아이콘  제작자: Vectors Market - Flaticon</a>

struct MyNavigationView : View {
    init() {
        //네비게이션바 커스텀
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "MainColor")
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    
    var body: some View {
            NavigationView {
                
                VStack{
                    
                    //Spacer()
                    Group{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    
                    //상단 제작중 뷰
                    HStack{
                        Group{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                        HStack(){
                            
                            Spacer()
                            Image("MainFlower")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width:80, height:50)
                            Spacer()
                            Spacer()
                            
                            VStack(alignment: .leading){
                                
                                Spacer()
                                Spacer()
                                Text("꽃다발을 \n제작하고 있어요")
                                    .font(.system(size: 15))
                                    .fontWeight(.heavy)
                                
                                Spacer()
                                
                                Text("10월 10일 김준식님께 전달 예정")
                                    .font(.system(size: 9))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color(red: 0.643, green: 0.643, blue: 0.643))
                                Spacer()
                                
                            }
                            Spacer()
                            
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("BorderColor"), lineWidth: 2))
                        Group{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                    }
                    
                    //Spacer()
                    Group{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    
                    //메인 뷰 - 첫번째 줄
                    HStack{
                        //Spacer()
                        Group{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                        
                        HStack{
                            MainButtonView(destination: FlowerListView(), buttonText:"꽃다발\n    주문하기", imageName:"Flower1")
                            
                            Spacer()
                            
                            MainButtonView(destination: FlowerListView(), buttonText:" 선물받은\n   NFT확인", imageName:"Flower2")
                        }
                        
                        //Spacer()
                        Group{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                    }
                    
                    //Spacer()
                    Group{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    
                    //메인 뷰 - 두번째 줄
                    HStack{
                        //Spacer()
                        Group{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                        
                        HStack{
                            MainButtonView(destination: ChatView(), buttonText:"꽃다발\n    추천받기", imageName:"Flower3")
                            
                            Spacer()
                            
                            MainButtonView(destination: AnniversaryManagementView(), buttonText:"기념일 관리", imageName:"Flower4")
                        }
                        
                        //Spacer()
                        Group{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                    }
                    
                    //Spacer()
                    Group{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    
                    Spacer()
                    
                    //공지사항 뷰
                    //공지사항 뷰
                    NavigationLink(destination: NoticesView()) {
                        HStack{
                            //Spacer()
                            Group{
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                            
                            HStack(){
                                
                                Spacer()
                                
                                VStack(alignment: .leading){
                                    Spacer()
                                    Text("FLORY 이야기")
                                        .font(.system(size: 18))
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.black)
                                    
                                    Spacer()
                                    
                                    Text("공지사항을 들어보세요")
                                        .font(.system(size: 12))
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color(red: 0.643, green: 0.643, blue: 0.643))
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    
                                }
                                
                                Spacer()
                                Image("Megaphone")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width:70, height:40)
                                
                                Spacer()
                                
                            }
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("BorderColor"), lineWidth: 2))
                            
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color("BorderColor"), lineWidth: 2))
                            Group{
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                            
                        }
                    }
                    
                    //Spacer()
                    Group{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
                .navigationTitle("FLORY")
                
            }
    }
}
struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
