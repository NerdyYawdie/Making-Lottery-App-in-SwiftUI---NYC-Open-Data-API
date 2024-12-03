//

import Foundation

class RowViewModel {
    
    let dateFormatter = DateFormatter()
    let winningNumber: WinningNumbers
    
    init(winningNumber: WinningNumbers) {
        self.winningNumber = winningNumber
    }
    
    func convertDate() -> Date? {
        //"2024-11-23T00:00:00.000"
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSS"
        let winningNumberDate = dateFormatter.date(from: winningNumber.draw_date)
        return winningNumberDate
    }
}
