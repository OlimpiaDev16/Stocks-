//
//  ContentView.swift
//  Stocks.CashApp
//
//  Created by Olimpia Compean on 9/6/24.
//

import SwiftUI

struct ContentView: View {
    @State var stocks = StockViewModel()
    
    var body: some View {
        VStack {
            ForEach(stocks.stock, id: \.self) { stock in
                Text(stock.name)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
