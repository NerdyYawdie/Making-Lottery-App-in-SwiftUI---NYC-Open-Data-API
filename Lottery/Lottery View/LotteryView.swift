//

import SwiftUI

struct LotteryView: View {
    
    @StateObject var viewModel: LotteryViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if !viewModel.winningNumbers.isEmpty {
                    List(viewModel.winningNumbers) { winningNumber in
                        RowView(viewModel: RowViewModel(winningNumber: winningNumber))
                    }
                    .listStyle(.plain)
                } else {
                    ContentUnavailableView(LocalizedStringKey("No Winning Numbers Found"), systemImage: "magnifyingglass", description: Text("Something went wrong! Please check your internet connection & retry."))
                }
                
            }
            .navigationTitle(Text("Lottery"))
            .task {
                await viewModel.fetchWinningNumbers()
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView(LocalizedStringKey("Fetching Winning Numbers...💰"))
                }
            }
            .refreshable {
                await viewModel.fetchWinningNumbers()
            }
            .alert(isPresented: $viewModel.showErrorAlert, error: viewModel.errorType) {
                Button(LocalizedStringKey("OKAY"), role: .cancel) {
                    viewModel.showErrorAlert.toggle()
                }
            }
        }
    }
}

#Preview {
    LotteryView(viewModel: LotteryViewModel())
}
