//

import Foundation

class LotteryViewModel: ObservableObject {
    
    @Published var winningNumbers: [WinningNumbers] = []
    
    @Published var isLoading: Bool = false
    
    @Published var errorType: LotteryServiceError?
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    
    let service: LotteryService
    
    init(service: LotteryService = LotteryServiceImpl()) {
        self.service = service
    }
    
    @MainActor
    func fetchWinningNumbers() async {
        
        defer {
            isLoading = false
        }
        
        do {
            isLoading = true
            
            winningNumbers = try await service.fetchWinningNumbers()

        } catch {
            if let customError = error as? LotteryServiceError {
                errorType = customError
            }
            showErrorAlert.toggle()
        }
    }
}
