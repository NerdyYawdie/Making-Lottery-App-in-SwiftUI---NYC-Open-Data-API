//

import Foundation

protocol LotteryService {
    func fetchWinningNumbers() async throws -> [WinningNumbers]
}

enum LotteryServiceError: LocalizedError {
    
    case invalidURL
    case invalidResponse
    case custom(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Yo this is an invalid URL"
        case .invalidResponse:
            return "Invalid response"
        case .custom(let error):
            return "Something definitely went wrong: \(error)"
        }
    }
}


class LotteryServiceImpl: LotteryService {
    
    private let endpoint: String = "https://data.ny.gov/resource/d6yy-54nr.json"
    
    func fetchWinningNumbers() async throws -> [WinningNumbers] {
        
        guard let url = URL(string: endpoint) else {
            throw LotteryServiceError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpURLResponse.statusCode) else {
                throw LotteryServiceError.invalidResponse
            }
            
            let winningNumbers = try JSONDecoder().decode([WinningNumbers].self, from: data)
            return winningNumbers
            
        } catch {
            throw LotteryServiceError.custom(error.localizedDescription)
        }
    }
}
