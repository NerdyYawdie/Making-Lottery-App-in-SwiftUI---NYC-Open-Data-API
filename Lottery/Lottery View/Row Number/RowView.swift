//

import SwiftUI

struct RowView: View {
    
    var viewModel: RowViewModel
    
    var body: some View {
        VStack {
            if let winningDate = viewModel.convertDate() {
                GroupBox {
                    Text(winningDate, style: .date)
                }
                
            }
            
            HStack {
                ForEach(viewModel.winningNumber.numbersList.indices, id: \.self) { index in
                    Text(viewModel.winningNumber.numbersList[index])
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                        .background(Circle().fill(Color.red))
                }
            }
            
            Text("Multiplier: \(viewModel.winningNumber.multiplier)")
        }
    }
}

#Preview {
    RowView(viewModel: RowViewModel(winningNumber: WinningNumbers(draw_date: "2024-11-23T00:00:00.000", winning_numbers: "12 13 34 44 67 08", multiplier: "3")))
}
