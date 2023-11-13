//
//  ContentView.swift
//  FLORY
//
//  Created by gourderased on 2023/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var sharedData = SharedData()
    //스플래시 뷰
    @State private var showMainView = false
    //로그인 뷰
    @State private var showLoginView = false
    //홈화면 뷰
    @State private var isLoggedIn = false
    //회원가입 뷰
    @State private var showSignUpView = false

    var body: some View {
        ZStack {
            //스플래시 분기
            if showMainView {
                //로그인뷰와 홈화면 분기
                if !isLoggedIn {
                    if showLoginView && !showSignUpView{
                        LoginView(isLoggedIn: $isLoggedIn, showSignUpView: $showSignUpView, sharedData: sharedData)
                    } else if !showLoginView && !showSignUpView {
                        IntroView(
                            showLoginView: $showLoginView)
                    } else {
                        SignUpView(showLoginView: $showLoginView,
                        showSignUpView: $showSignUpView)
                    }
                    
                } else {
                    MyNavigationView()
                        .environmentObject(sharedData)
                }
            }
            else {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation {
                                showMainView = true
                            }
                        }
                    }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

