import SwiftUI
import Combine

struct FlowerListView: View {
    // ViewModel
    @ObservedObject var viewModel = FlowerListViewModel()
 
    //searchBar
    @State private var text = ""

    // Grid columns
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible(minimum: 100, maximum: .infinity))
    ]

    var body: some View {
        ScrollView {
            VStack {
                Spacer().frame(height: 30)
                
                // Search bar
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

                // Grid view
                HStack {
                    Group {
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(viewModel.flowers) { flower in
                            VStack {
                                Image("ListFlower")  // 이미지는 여전히 수정되지 않았습니다.
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(flower.name)
                                            .font(.system(size: 18))
                                            .bold()
                                            .foregroundColor(.gray)
                                        Text(flower.description)
                                            .font(.caption)
                                        Text("송이당 ₩\(flower.price)")
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
                    Group {
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("구매하기")
        .onAppear {
            viewModel.fetchFlowers()  // 화면이 표시될 때 꽃 데이터를 가져옵니다.
        }
    }
}

struct FlowerListView_Previews: PreviewProvider {
    static var previews: some View {
        FlowerListView()
    }
}
