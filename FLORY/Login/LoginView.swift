import SwiftUI

struct LoginView: View {
    
    //텍스트 필드 변수
    @State private var email = ""
    @State private var password = ""
    
    //로그인 상태 바인딩
    @Binding var isLoggedIn: Bool
    
    //회원가입 화면
    @Binding var showSignUpView: Bool
    
    //로그인
    @ObservedObject private var viewModel: LoginViewModel
    @State private var showingLoginSuccessAlert = false
    
    @EnvironmentObject var sharedData: SharedData
    
    init(isLoggedIn: Binding<Bool>, showSignUpView: Binding<Bool>, sharedData: SharedData) {
        self._isLoggedIn = isLoggedIn
        self._showSignUpView = showSignUpView
        self.viewModel = LoginViewModel(sharedData: sharedData)
    }
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 20) {
                
                Image("MainLogo")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .padding(.top, 100)
                
                Spacer()
                HStack{
                    Spacer().frame(width:20)
                    
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
                            viewModel.login(with: email, password: password)
                                
                        }) {
                            Text("로그인")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .background(Color("MainColor"))
                        .cornerRadius(3)
                        .alert(isPresented: $showingLoginSuccessAlert) {
                            Alert(title: Text("로그인 성공"), message: Text("로그인이 성공적으로 완료되었습니다."), dismissButton: .default(Text("확인"), action: {
                                self.isLoggedIn = true // 사용자가 '확인'을 누를 때 로그인 상태 변경
                            }))
                        }
                        
                        Text("비밀번호를 잊으셨나요?")
                            .padding(.top, 20)
                            .foregroundColor(Color("MainColor"))
                        
                        Divider()
                            .padding(.top, 10)
                        
                    }
                    .padding(.horizontal)
                    
                    Spacer().frame(width:20)
                }
                HStack{
                    Spacer().frame(width:100)
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
                    Spacer().frame(width:100)
                }
                Spacer()
                
            }
            .onAppear {
                // onLoginSuccess 클로저 설정
                viewModel.onLoginSuccess = {
                    showingLoginSuccessAlert = true
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            let sharedData = SharedData()

                    // 생성된 sharedData를 LoginView의 초기화에 전달합니다.
                    LoginView(isLoggedIn: .constant(false),
                              showSignUpView: .constant(false),
                              sharedData: sharedData)
                }
    }
}
