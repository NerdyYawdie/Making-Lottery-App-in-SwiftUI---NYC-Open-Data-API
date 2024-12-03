//

import Foundation

struct WinningNumbers: Decodable, Identifiable {
    let id = UUID()
    let draw_date: String
    let winning_numbers: String
    let multiplier: String
    
    var numbersList: [String] {
        let numbers = winning_numbers.components(separatedBy: " ")
        return numbers
    }
}
