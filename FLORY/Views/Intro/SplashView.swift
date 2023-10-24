//
//  SplashView.swift
//  FLORY
//
//  Created by gourderased on 2023/10/08.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
            ZStack {
                Color.white
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("MainLogo")
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                    
                }
            }
        }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
