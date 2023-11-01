//
//  PaymentView.swift
//  FLORY
//
//  Created by gourderased on 2023/09/25.
//

import SwiftUI



struct PaymentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var date = Date()
    @Binding var quantity: Int
    @Binding var pricePerItem: Int
    
    @State private var deliveryFee: Int = 3000
    
    @State private var name: String = ""
    @State private var zipCode: String = ""
    @State private var address: String = ""
    @State private var detailAddess: String = ""
    @State private var nickname: String = ""
    @State private var phrases: String = ""
    @State private var nftText: String = ""
    
    @State private var showingAlert = false
    
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    var body: some View {
        ScrollView() {
            Spacer()
            
            VStack{
                
                HStack{
                    Spacer()
                    
                    VStack{
                        //뒤로가기 버튼
                        HStack{
                            Button(action: {
                                self.presentation.wrappedValue.dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .font(.title)
                                    .padding()
                            }
                            Spacer()
                        }
                        .padding([.leading])
                        
                        //주문 상품
                        Group{
                            HStack{
                                
                                Text("주문 상품")
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(.leading, 20)
                                Spacer()
                            }
                            
                            HStack{
                                Image("ListFlower")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Spacer()
                                VStack{
                                    Spacer()
                                    Spacer()
                                    HStack{
                                        Text("수국")
                                            .font(.system(size: 18, weight: .bold))
                                        Group{
                                            Spacer()
                                            Spacer()
                                            Spacer()
                                            Spacer()
                                        }
                                    }
                                    HStack{
                                        Text("송이 당 ₩\(pricePerItem)\n(최소 주문 수량 : 3)")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .bold))
                                        Spacer()
                                    }
                                    Spacer()
                                    Spacer()
                                    HStack{
                                        Text("\(pricePerItem * quantity)원")
                                            .font(.system(size: 18, weight: .bold))
                                        
                                        Text("| \(quantity)송이")
                                        Spacer()
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                        }
                        
                        //divder
                        Divider()
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                        
                        //배송 정보
                        Group{
                            //배송 날짜
                            Group{
                                HStack{
                                    Text("받는 날짜")
                                        .font(.system(size: 20, weight: .bold))
                                        .padding(.leading, 40)
                                    Spacer()
                                }
                                HStack{
                                    Spacer()
                                    
                                    DatePicker(
                                        "희망 수령일",
                                        selection: $date,
                                        displayedComponents: [.date]
                                    )
                                    .padding(.leading, 20)
                                    Spacer()
                                }
                            }
                            
                            Spacer().frame(height: 40)
                            
                            //받는 분 정보
                            Group{
                                HStack{
                                    Text("받는 분 정보")
                                        .font(.system(size: 20, weight: .bold))
                                        .padding(.leading, 40)
                                    Spacer()
                                }
                                
                                Spacer().frame(height:20)
                                
                                //받는 분 성함
                                HStack{
                                    
                                    Text("받는 분 성함")
                                        .font(.system(size: 18, weight: .regular))
                                        .padding(.leading, 20)
                                    Spacer()
                                    TextField("받는 분 성함을 입력해주세요", text: $name)
                                        .padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 3)
                                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                        )
                                    Spacer().frame(width:20)
                                }
                                
                                
                                Spacer().frame(height: 20)
                                
                                //배송지 주소
                                Group{
                                    //배송지 주소 - 우편번호
                                    HStack{
                                        Group{
                                            Text("배송지  주소")
                                                .font(.system(size: 18, weight: .regular))
                                                .padding(.leading, 20)
                                            TextField("우편번호", text: $zipCode)
                                                .padding()
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 3)
                                                        .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                                )
                                            Button(action: {
                                                //돋보기 동작
                                            }) {
                                                Image(systemName: "magnifyingglass")
                                                    .font(.system(size: 24))
                                                    .foregroundColor(.white)
                                                    .padding(10)
                                                    .background(Color("MainColor"))
                                                    .clipShape(Rectangle())
                                                    .cornerRadius(10)
                                                
                                            }
                                            
                                        }
                                    }
                                    //배송지 주소 - 주소
                                    HStack{
                                        Spacer().frame(width:20)
                                        TextField("주소", text: $address)
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 3)
                                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                            )
                                        Spacer().frame(width:20)
                                    }
                                    //배송지 주소 - 상세 주소
                                    HStack{
                                        Spacer().frame(width:20)
                                        TextField("상세 주소", text: $address)
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 3)
                                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                            )
                                        Spacer().frame(width:20)
                                    }
                                }
                            }
                        }
                        
                        //divder
                        Divider()
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                        
                        //NFT 정보
                        Group {
                            // NFT 정보
                            VStack(spacing: 20) {
                                HStack {
                                    Text("NFT 정보")
                                        .font(.system(size: 20, weight: .bold))
                                        .padding(.leading, 20)
                                    Spacer()
                                }

                                // 받는 분 닉네임
                                HStack {
                                    Text("받는 분 닉네임")
                                        .font(.system(size: 18, weight: .regular))
                                        .padding(.leading, 20)
                                    
                                    TextField("FLORY에 가입된 닉네임", text: $nickname)
                                        .padding()
                                        .overlay(RoundedRectangle(cornerRadius: 3)
                                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1))
                                    Spacer().frame(width:20)
                                }

                                Text("NFT 선물을 위해서는 받는 분도 FLORY에 가입이 필요합니다.")
                                    .foregroundColor(Color.gray)
                                    .font(.system(size: 14, weight: .regular))

                                // NFT 문구
                                HStack {
                                    Text("NFT 문구")
                                        .font(.system(size: 16, weight: .bold))
                                        .padding(.leading, 40)
                                    Spacer()
                                }

                                HStack {
                                    Spacer().frame(width:20)
                                    TextField("NFT에 기입할 문구를 적어주세요", text: $nftText)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .overlay(RoundedRectangle(cornerRadius: 3)
                                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1))
                                    Spacer().frame(width:20)
                                }
                            }
                            .padding(.vertical, 20)
                        }
                        
                        //divder
                        Divider()
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                        
                        
                        //결제정보 & 결제하기 버튼
                        Group{
                            //결제 정보
                            VStack(spacing: 20) { // 각 항목 사이의 간격을 20으로 설정
                                Text("결제 정보")
                                    .font(.system(size: 24, weight: .bold))
                                    .padding(.horizontal)

                                //주문상품
                                HStack {
                                    Text("주문 상품")
                                        .font(.system(size: 18, weight: .bold))
                                    Spacer()
                                    Text("\(quantity*pricePerItem)원")
                                        .font(.system(size: 18, weight: .bold))
                                }
                                .padding(.horizontal)

                                //배송비
                                HStack {
                                    Text("배송비")
                                        .font(.system(size: 18, weight: .bold))
                                    Spacer()
                                    Text("\(deliveryFee)원")
                                        .font(.system(size: 18, weight: .bold))
                                }
                                .padding(.horizontal)

                                //최종 결제 금액
                                HStack {
                                    Text("최종 결제 금액")
                                        .font(.system(size: 24, weight: .bold))
                                    Spacer()
                                    Text("\(deliveryFee + quantity * pricePerItem)원")
                                        .font(.system(size: 24, weight: .bold))
                                }
                                .padding(.horizontal)

                                //결제 버튼
                                Button(action:{
                                    self.showingAlert = true
                                }) {
                                    Text("결제하기")
                                        .foregroundColor(.black)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                }
                                .background(Color("MainColor"))
                                .cornerRadius(3)
                                .padding(.top, 10) // 위쪽에만 padding 10 추가
                                .alert(isPresented: $showingAlert) {
                                    Alert(title: Text("결제가 완료되었습니다."),
                                          message: Text("꽃다발이 배송된 직후, NFT가 발송됩니다."),
                                          dismissButton: Alert.Button.default(Text("확인")) {
                                              self.presentationMode.wrappedValue.dismiss()
                                          })
                                }
                            }
                            .padding()                         }

                    }
                    
                    Spacer()
                }
                
            }
            
        }
        .navigationTitle("결제")
    }
    
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(quantity: .constant(3), pricePerItem: .constant(1799))
    }
}
