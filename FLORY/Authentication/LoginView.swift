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
        NavigationView {
            VStack(spacing: 20) {
                
                Image("MainLogo")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .padding(.top, 90)
                
                Spacer()
                
                VStack(spacing: 10) {
                    
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
                    
                    Button(action: {
                        self.isLoggedIn = true
                    }) {
                        Text("로그인")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .background(Color("MainColor"))
                    .cornerRadius(3)
                    
                    Text("비밀번호를 잊으셨나요?")
                        .padding(.top, 20)
                        .foregroundColor(Color("MainColor"))
                    
                    Divider()
                        .padding(.top, 10)
                }
                .padding(.horizontal)
                
                Spacer().frame(height:5)
                
                HStack{
                    Spacer().frame(width:80)
                    Button(action: {
                        self.showSignUpView = true
                    }) {
                        Text("새 계정 만들기")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .background(Color("SecondaryColor"))
                    .cornerRadius(3)
                    .padding(.horizontal)
                    Spacer().frame(width:80)
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
