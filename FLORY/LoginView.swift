//
//  LoginView.swift
//  FLORY
//
//  Created by gourderased on 2023/10/08.
//

import SwiftUI

struct LoginView: View {
    
    //텍스트 필드 변수
    @State private var email = ""
    @State private var password = ""
    
    //로그인 상태 바인딩
    @Binding var isLoggedIn: Bool
    
    //회원가입 화면
    @Binding var showSignUpView: Bool
    
    var body: some View {
        NavigationView{
            VStack{
                
                Spacer()
                Spacer()
                
                Image("MainLogo")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack{
                    Spacer()
                    Spacer()
                    
                    VStack{
                        
                        TextField("이메일을 입력해주세요", text: $email)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                            )
                        SecureField("패스워드를 입력해주세요", text: $password)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                            )
                        
                        Button(action:{
                            self.isLoggedIn = true
                        }) {
                            Text("로그인")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .background(Color("MainColor"))
                        .cornerRadius(3)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        
                        HStack{
                            Spacer()
                            Spacer()
                            
                            Text("비밀번호를 잊으셨나요?")
                                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                                .foregroundColor(Color("MainColor"))
                            Spacer()
                            Spacer()
                        }
                        
                        VStack {
                            Divider()
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                        }
                        
                    }
                    Spacer()
                    Spacer()
                }
                
                Spacer()
                
                HStack{
                    
                    Group{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    Group{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    
                    Button(action:{
                        self.showSignUpView = true
                    }) {
                        Text("새 계정 만들기")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .background(Color("SecondaryColor"))
                    .cornerRadius(3)
                    
                    
                    Group{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    Group{
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
                
                Spacer()
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView(isLoggedIn: .constant(false), showSignUpView: .constant(false))
        }
    }
}
