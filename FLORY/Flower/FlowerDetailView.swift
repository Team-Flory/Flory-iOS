//
//  FlowerDetailView.swift
//  FLORY
//
//  Created by gourderased on 2023/10/11.
//

import SwiftUI

struct FlowerDetailView: View {
    
    @StateObject private var viewModel = FlowerDetailViewModel()
    @State private var quantity = 3
    @State private var showingPayment = false
    @State private var pricePerItem = Int()
    var body: some View {
        
            GeometryReader { geometry in
                VStack{
                    
                    Group{
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
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                
                    Image("ListFlower")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Group{
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
                    }
                    Group{
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
                    }
                    
                    Spacer(minLength: 0) // minLength를 0으로 설정하여 크기가 동적으로 조절되게 합니다.
                    
                    VStack{
                        Spacer()
                        Spacer()
                        
                        //꽃이름
                        HStack{
                            Spacer()
                            Text(viewModel.flower?.name ?? "Loading...")
                                .font(.system(size: 30, weight: .bold))
                            Group{
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                        }
                        
                        Group{
                            Spacer()
                            Spacer()
                            
                        }
                        
                        //가격, 스테퍼
                        HStack{
                            Spacer()
                            Text("송이 당 ₩\(viewModel.flower?.price ?? 0) (최소 주문 수량: 3)")
                                .font(.system(size: 16))
                                .foregroundColor(Color.gray)
                            
                            Group{
                                Spacer()
                                Spacer()
                                
                            }
                            //스테퍼
                            HStack {
                                
                                // -버튼
                                Button(action: {
                                    if quantity > 3 { quantity -= 1 }
                                }) {
                                    Text("-")
                                        .foregroundColor(Color.gray)
                                        .font(.title)
                                        .frame(width: 25, height: 25)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                        )
                                    
                                }
                                Spacer().frame(width:15)
                                Text("\(quantity)")
                                    .font(.body)
                                Spacer().frame(width:15)
                                // +버튼
                                Button(action: {
                                    quantity += 1
                                }) {
                                    Text("+")
                                        .foregroundColor(Color.gray)
                                        .font(.title)
                                        .frame(width: 25, height: 25)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                        )
                                }
                            }
                            .padding([.leading, .trailing], 20)
                            .frame(height: 40)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                            )
                            Spacer()
                            
                        }
                        
                        Group{
                            Spacer()
                            Spacer()
                        }
                        
                        //상세 설명
                        HStack{
                            Spacer()
                            Text("지혜와 평화라는 좋은 꽃말을 담고 있어요")
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
                        }
                        HStack{
                            Group{
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                            Button(action: {
                                showingPayment = true
                            }){
                                Text("선물하기")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                            }
                            .background(Color("MainColor"))
                            .cornerRadius(20)
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                            Group{
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                        }
                        
                        Group{
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                        
                    }
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.gray, lineWidth: 1)
                        .padding(.bottom, 0))
                }
                .onAppear{
                    viewModel.fetchFlowerDetail()
                }
            }.edgesIgnoringSafeArea(.all)
            .fullScreenCover(isPresented: $showingPayment) {
                PaymentView(quantity: $quantity, pricePerItem: Binding.constant(viewModel.flower?.price ?? 0))
            }
    }
}

struct FlowerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FlowerDetailView()
    }
}

