//
//  SignUpView.swift
//  FLORY
//
//  Created by gourderased on 2023/10/10.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel = SignUpViewModel()
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var phoneNumber = ""
    @State private var nickname = ""
    @State private var walletAddress = ""
    
    @State private var showAlert = false;
    @State private var alertMessage = ""
    
    @Binding var showLoginView: Bool
    @Binding var showSignUpView: Bool
    
    var body: some View {
        
        VStack{
            
            Spacer()
            
            //로고
            HStack{
                Image("MainLogo")
                    .resizable()
                    .frame(width: 210, height: 120)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                
               Spacer()
            
            
            }
            
            Spacer()
            Spacer()
            
            //회원 정보
            HStack{
                Spacer()
                Text("가입하기")
                    .font(.system(size: 30, weight: .bold))
                Group{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
            }
            
            HStack{
                
                Group{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
                VStack{
                    //회원 정보
                    Group{
                        TextField("이름을 입력해주세요", text: $name)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                            )
                        TextField("닉네임을 입력해주세요", text: $nickname)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                            )
                        TextField("이메일을 입력해주세요", text: $email)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                            )
                        SecureField("비밀번호를 입력하세요", text: $password)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                            )
                        TextField("휴대폰 번호를 입력하세요", text: $phoneNumber)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                            )
                    }
                    
                    Spacer()
                    
                    //지갑 정보
                    Group{
                        HStack{
                            Spacer()
                            Text("지갑 정보는 NFT선물 수령을 위해 필요합니다")
                                .font(.system(size: 15))
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                            
                        
                        TextField("지갑 주소를 입력해주세요", text: $walletAddress)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 3)
                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                            )
                        
                    }
                    
                    Spacer()
                    
                    //가입하기 버튼
                    Button(action:{
                        let user = User(name: self.name,
                                        email: self.email,
                                        password: self.password,
                                        phoneNumber: self.phoneNumber,
                                        nickname: self.nickname,
                                        walletAddress: self.walletAddress)
                        
                        viewModel.signUp(user: user) { success, errorMessage in
                            if success {
                                self.alertMessage = "\(self.name)님, 환영합니다! FLORY에 가입해 주셔서 감사합니다."
                                showAlert =  true
                            }
                            else {
                                self.alertMessage = errorMessage ?? "가입에 실패했습니다. 다시 시도해주세요."
                                showAlert =  true
                            }
                            
                        }
                    }) {
                        Text("가입하기")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("FLORY"), message: Text(alertMessage), dismissButton: .default(Text("확인")) {
                            if self.alertMessage == "\(self.name)님, 환영합니다! FLORY에 가입해 주셔서 감사합니다." {
                                        self.showLoginView = true
                                        self.showSignUpView = false
                                    }
                        })
                    }
                    .background(Color("MainColor"))
                    .cornerRadius(3)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                }
                
                Group{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                
            }
            
            Spacer()
            Spacer()
            Spacer()
            
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(showLoginView:.constant(false), showSignUpView:.constant(true))
    }
}
