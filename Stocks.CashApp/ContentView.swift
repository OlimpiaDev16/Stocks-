//
//  ContentView.swift
//  Stocks.CashApp
//
//  Created by Olimpia Compean on 9/6/24.
//

import SwiftUI

struct ContentView: View {
    
   private let stocks = StockViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Stocks")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            Text(Date(), style: .date)
                .font(.custom("Arial",size: 26))
                .foregroundColor(Color.gray)
                .padding(.horizontal)
            
            Divider()
            
            List(stocks.stock, id: \.self) { stock in
                StockView(
                    name: stock.name,
                    ticket: stock.ticker,
                    currency: stock.currency,
                    currentPrice: stock.current_price_cents,
                    timeStamp: stock.current_price_timestamp,
                    quantity: stock.quantity
                )
            }
            .listStyle(.plain)
        }
    }
}

#Preview {
    ContentView()
}

struct StockView: View {
    let name, ticket, currency: String
    let currentPrice, timeStamp: Int
    let quantity: Int?
    
    var body: some View {
        
        let timeInterval = TimeInterval(timeStamp)
        let date = Date(timeInterval: timeInterval, since: .init())
        
        HStack {
          VStack(alignment: .leading) {
                HStack {
                    Text(ticket)
                        .font(.custom("Arial", fixedSize: 22))
                        .fontWeight(.bold)
                    if let quantity = quantity {
                        Text("\(quantity)")
                            .font(.custom("Arial", fixedSize: 16))
                            .frame(width: 25, height: 25)
                            .background(Color.green)
                            .cornerRadius(2.0)
                    } else {
                        Image(systemName: "arrowshape.up.circle.fill")
                    }
                }
              
                Text(name)
                    .font(.custom("Arial", fixedSize: 16))
                    .foregroundColor(Color.gray)
            }
           
            Spacer()
            
            VStack {
                Text("\(currentPrice / 100)" + " " + currency)
                    .font(.custom("Arial", size: 12))
                    .padding([.vertical, .horizontal], 8)
                    .background(Color.pink)
                    .cornerRadius(3.0)
              
                Text("\(date, format: .dateTime.day().month().year())")
                    .font(.custom("Arial", size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
            }
        }
    }
}


