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
    //꽃 수량
    @Binding var quantity: Int
    //가격 바인딩 추가
    @Binding var pricePerItem: Int
    
    @State private var deliveryFee: Int = 3000
    
    @State private var name: String = ""
    @State private var zipCode: String = ""
    @State private var address: String = ""
    @State private var detailAddess: String = ""
    @State private var nickname: String = ""
    @State private var phrases: String = ""
    
    @State private var showingAlert = false
    
    var body: some View {
        ScrollView() {
            Spacer()
            
            VStack{
                
                HStack{
                    Spacer()
                    
                    VStack{
                        //주문 상품
                        Group{
                            HStack{
                                Spacer()
                                Text("주문 상품")
                                    .font(.system(size: 20, weight: .bold))
                                
                                Group{
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
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
                        
                        //Spacer()
                        Group{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                        
                        //배송 날짜
                        Group{
                            HStack{
                                Spacer()
                                Text("받는 날짜")
                                    .font(.system(size: 20, weight: .bold))
                                
                                Group{
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
                                DatePicker(
                                    "희망 수령일",
                                    selection: $date,
                                    displayedComponents: [.date]
                                )
                                Group{
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                            }
                        }
                        
                        //Spacer()
                        Group{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                        
                        //받는 분 정보
                        Group{
                            HStack{
                                Spacer()
                                Text("받는 분 정보")
                                    .font(.system(size: 20, weight: .bold))
                                
                                Group{
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                            
                            //받는 분 성함
                            HStack{
                                Group{
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                                Group{
                                    Text("받는 분 성함")
                                        .font(.system(size: 18, weight: .regular))
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    TextField("받는 분 성함을 입력해주세요", text: $name)
                                        .padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 3)
                                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                        )
                                }
                                Spacer()
                                Spacer()
                            }
                            
                            Spacer()
                            
                            //배송지 주소
                            Group{
                                //배송지 주소 - 우편번호
                                HStack{
                                    Group{
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                    }
                                    Group{
                                        Text("배송지  주소")
                                            .font(.system(size: 18, weight: .regular))
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        TextField("우편번호", text: $zipCode)
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 3)
                                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                            )
                                        Spacer()
                                        Button(action: {
                                            // 돋보기 아이콘 버튼을 눌렀을 때 수행할 동작 구현
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
                                    Spacer()
                                    Spacer()
                                }
                                //배송지 주소 - 주소
                                HStack{
                                    Group{
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                    }
                                    Group{
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
                                        }
                                        TextField("주소", text: $address)
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 3)
                                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                            )
                                    }
                                    Spacer()
                                    Spacer()
                                }
                                //배송지 주소 - 상세 주소
                                HStack{
                                    Group{
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                    }
                                    Group{
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
                                        }
                                        TextField("상세 주소", text: $address)
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 3)
                                                    .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                            )
                                    }
                                    Spacer()
                                    Spacer()
                                }
                            }
                        }
                        
                        //NFT 정보
                        Group{
                            HStack{
                                Spacer()
                                Text("NFT 정보")
                                    .font(.system(size: 20, weight: .bold))
                                
                                Group{
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                            
                            //받는 분 닉네임
                            HStack{
                                Group{
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                                Group{
                                    Text("받는 분 닉네임")
                                        .font(.system(size: 18, weight: .regular))
                                    Spacer()
                                    Spacer()
                                    TextField("FLORY에 가입된 닉네임", text: $nickname)
                                        .padding()
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 3)
                                                .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                        )
                                }
                                Spacer()
                                Spacer()
                            }
                            
                            Spacer()
                            Text("NFT 선물을 위해서는 받는 분도 FLORY에 가입이 필요합니다.")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 14, weight: .regular))
                            
                            Group{
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                            
                            //nft문구
                            HStack{
                                Spacer()
                                
                                Group{
                                    Text("NFT 문구")
                                        .font(.system(size: 18, weight: .bold))
                                    Spacer()
                                    Spacer()
                                    
                                }
                                Group{
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
                                    
                                }
                                TextField("NFT에 기입할 문구를 적어주세요", text: $nickname)
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 3)
                                            .stroke(Color.gray.opacity(0.6), lineWidth: 1)
                                    )
                                Group{
                                    Spacer()
                                    Spacer()
                                    
                                    
                                }
                            }
                        }
                        
                        //diver
                        Group{
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            
                            Divider()
                            
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            
                        }
                        
                        //결제 정보
                        Group{
                            HStack{
                                Spacer()
                                Text("결제 정보")
                                    .font(.system(size: 24, weight: .bold))
                                
                                Group{
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                            Spacer()
                            
                            //주문상품
                            HStack{
                                Group{
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                                HStack{
                                    Text("주문 상품")
                                        .font(.system(size: 18, weight: .bold))
                                    Group{
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                    }
                                    Text("\(quantity*pricePerItem)원")
                                        .font(.system(size: 18, weight: .bold))
                                }
                                Group{
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                            Spacer()
                            
                            //배송비
                            HStack{
                                Group{
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                                HStack{
                                    Text("배송비")
                                        .font(.system(size: 18, weight: .bold))
                                    Group{
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                    }
                                    Text("\(deliveryFee)원")
                                        .font(.system(size: 18, weight: .bold))
                                }
                                Group{
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
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                                Spacer()
                            }
                            
                            //최종 결제 금액
                            HStack{
                                Group{
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    
                                }
                                HStack{
                                    Text("최종 결제 금액")
                                        .font(.system(size: 24, weight: .bold))
                                    Group{
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                    }
                                    Text("\(deliveryFee + quantity * pricePerItem)원")
                                        .font(.system(size: 24, weight: .bold))
                                }
                                Group{
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                            }
                        }
                        
                        HStack{
                            Spacer()
                            
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
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("결제가 완료되었습니다."), message: Text("꽃다발이 배송된 직후, NFT가 발송됩니다."),
                                      dismissButton:
                                        Alert.Button.default(Text("확인")) {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                                )
                            }
                        }
                        Spacer()
                    }
                    
                    Group{
                        Spacer()
                        Spacer()
                        Spacer()
                    }
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
