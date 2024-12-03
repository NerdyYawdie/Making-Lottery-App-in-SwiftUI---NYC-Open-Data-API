//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LotteryView(viewModel: LotteryViewModel())
                .tabItem {
                    VStack {
                        Image(systemName: "01.circle.fill")
                        
                        Text("Lottery")
                    }
                }
        }
        
    }
}

#Preview {
    ContentView()
}
