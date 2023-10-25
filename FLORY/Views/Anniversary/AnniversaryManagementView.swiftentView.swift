import SwiftUI

struct Anniversary: Identifiable, Hashable {
    let id: UUID
    let date: Date
    let name: String
}

struct AnniversaryManagementView: View {
    @State private var selectedDate: Date = Date()
    @State private var anniversaries: [Anniversary] = []
    @State private var isAdding: Bool = false
    @State private var anniversaryName: String = ""

    var body: some View {
        VStack {
            DatePicker("기념일 날짜", selection: $selectedDate, displayedComponents: .date)
                .padding()

            TextField("기념일 제목", text: $anniversaryName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                let newAnniversary = Anniversary(id: UUID(), date: selectedDate.startOfDay, name: anniversaryName)
                anniversaries.append(newAnniversary)
                anniversaryName = ""
            }, label: {
                Text("기념일 추가하기")
            })
            .padding()
            
            List {
                ForEach(anniversaries, id: \.id) { anniversary in
                    HStack {
                        Text(anniversary.name)
                        Spacer()
                        Text("\(anniversary.date, formatter: dateFormatter)")
                        Button(action: {
                            if let index = anniversaries.firstIndex(where: { $0.id == anniversary.id }) {
                                anniversaries.remove(at: index)
                            }
                        }, label: {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        })
                    }
                }
            }
        }
        .navigationTitle("기념일 관리")
        .padding()
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()

extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
}

struct AnniversaryManagementView_Previews: PreviewProvider {
    static var previews: some View {
        AnniversaryManagementView()
    }
}
