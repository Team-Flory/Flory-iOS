//
//  ListButtonView.swift
//  FLORY
//
//  Created by gourderased on 2023/09/25.
//

import SwiftUI

struct FlowerCardView: View {
    let imageName: String
    let flowerName: String
    let color: String
    let meaning: String
    let pricePerStem: String
    let deliveryDaysRange: (Int, Int)
    
    var body: some View {
        HStack(){
            Spacer()

            VStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFit()
            }
            .padding(.all, 20)
            
            Spacer()
            Spacer()
            
            VStack(alignment:.leading){
                Spacer()
                Spacer()
                Text(flowerName)
                    .font(.system(size:15))
                    .fontWeight(.heavy)
                Spacer()
                Text("# \(color)")
                    .font(.system(size :9))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red :0.643 ,green :0.643 ,blue :0.643))
                Text("# \(meaning)")
                    .font(.system(size :9))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red :0.643 ,green :0.643 ,blue :0.643))
                Text("# 송이당 \(pricePerStem)원")
                    .font(.system(size :9))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red :0.643, green:0.643, blue:0.643))
                Text("\(deliveryDaysRange.0)~\(deliveryDaysRange.1)일 소요 예정")
                    .font(.system(size :9))
                    .fontWeight(.semibold)
                    .foregroundColor(Color(red :0.643, green:0.643, blue:0.643))
                Spacer()

            }
            Spacer()
            Spacer()
            NavigationLink(destination:PaymentView()){
                VStack{
                    Spacer()
                    Image(systemName: "cart")
                        .foregroundColor(.black)
                        .font(.title2)
                    
                        
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .background(Color("MainColor"))
                .cornerRadius(20, corners: .topRight)
                .cornerRadius(20, corners: .bottomRight)
            }
            
        }
        .frame(width:340, height:130)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color("BorderColor"), lineWidth: 2))
    }
}
