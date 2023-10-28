//
//  MainButtonView.swift
//  FLORY
//
//  Created by gourderased on 2023/09/25.
//

import SwiftUI

struct MainButtonView<Destination: View>: View {
    var destination: Destination
    var buttonText: String
    var imageName: String

    init(destination: Destination, buttonText: String, imageName: String) {
        self.destination = destination
        self.buttonText = buttonText
        self.imageName = imageName
    }

    var body: some View {
        VStack {
            NavigationLink(destination:self.destination) {
                ZStack {
                    VStack{
                        Spacer()
                        Spacer()
                        Spacer()
                        HStack{
                            Spacer()
                            Text(self.buttonText)
                                .font(.system(size:15))
                                .fontWeight(.heavy)
                                .foregroundColor(Color.black)
                                .frame(maxWidth:.infinity, alignment: .leading)
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                        
                        Spacer()

                        HStack{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Image(self.imageName)
                                .resizable()
                                .aspectRatio(contentMode:.fit)
                                .frame(width:min(80,75))
                            
                            Spacer()
    
                        }
                        
                        Spacer()

                    }
                }
            }
        }
        .frame(width :160 , height :150 )
        .overlay(RoundedRectangle(cornerRadius :20 ).stroke(Color("BorderColor"), lineWidth :2 ))
        
        
    }
}
