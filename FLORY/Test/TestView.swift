import SwiftUI

struct TestView: View {
    @ObservedObject var viewModel: TestViewModel = TestViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoadingOrError {
                Text("Loading or Error...")
            } else {
                VStack {
                    Text(viewModel.data?.title ?? "No title")
                        .font(.title)
                    Text(viewModel.data?.body ?? "No content")
                        .font(.body)
                }
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

struct TestView_previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
