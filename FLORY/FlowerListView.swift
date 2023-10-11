//
//  FlowerListView.swift
//  FLORY
//
//  Created by gourderased on 2023/09/25.
//

import SwiftUI

struct FlowerListView: View {
    //searchBar
    @State private var text = ""
    
    // Grid columns
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible(minimum: 100, maximum: .infinity))
    ]
    
    var body: some View {
        
        ScrollView{
        
            VStack{
                
                Spacer().frame(height: 30)
                //searchbar
                HStack {
                    Spacer()
                    TextField("Search", text: $text)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal, 10)
           
                    Spacer()
                }
                
                Spacer().frame(height: 20)
                
                //그리드뷰
                HStack{
                    
                    Group{
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<6) { _ in
                            VStack{
                                Image("ListFlower")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    //.frame(height: UIScreen.main.bounds.height * 0.18)
                                
                                HStack{
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("소국")
                                            .font(.system(size:18))
                                            .bold()
                                            .foregroundColor(.gray)
                                            
                                        Text("송이당 ₩1799")
                                            .font(.caption)
                                            
                                    }
                                    
                                    Spacer()
                                    
                                    NavigationLink(destination: FlowerDetailView()) {
                                        Image(systemName: "cart.fill")
                                            .font(.system(size: 24))
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(Color("MainColor"))
                                            .clipShape(Rectangle())
                                            .cornerRadius(10)
                                        
                                    }
                                }
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 2, y: 2)
                            
                        }
                        
                    }
                    
                    
                    Group{
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("구매하기")
    }
}
struct FlowerListView_Previews: PreviewProvider {
    static var previews: some View {
        FlowerListView()
    }
}
