//
//  ContentView.swift
//  Stocks.CashApp
//
//  Created by Olimpia Compean on 9/6/24.
//

import SwiftUI

struct StocksView: View {
    
    @ObservedObject var viewModel: StockViewModel
    
    var body: some View {
      
        switch viewModel.state {
        case .loading:
            ProgressView()
                .onAppear(perform: viewModel.loadStocks)
        case .badURL(let error):
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("There was an error loading the Stocks")
                .font(.callout)
                .padding()
            
            Button("Retry") {
                print(error.localizedDescription)
                viewModel.loadStocks()
            }
            .font(.headline)
            
        case .loaded(let stock):
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
                
                List(stock.stocks, id: \.self) { stock in
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
        case .emptyURL:
            VStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .frame(width: 180, height: 180)
                    .foregroundColor(.red)
                
                Text("SORRY")
                    .font(.largeTitle)
                
                Text("There are no stocks to display")
                    .font(.title3)
                
            }
            
        }
    }
}

#Preview {
    StocksView(viewModel: .init())
}

struct StockView: View {
    let name, ticket, currency: String
    let currentPrice, timeStamp: Int
    let quantity: Int?
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(ticket)
                        .font(.custom("Arial", fixedSize: 22))
                        .fontWeight(.bold)
                    
                    if let quantity = quantity {
                        Text("\(quantity)")
                            .font(.custom("Arial", fixedSize: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                            .background(Color.green)
                            .cornerRadius(2.0)
                    } else {
                        EmptyView()
                        
                    }
                }
                
                Text(name)
                    .font(.custom("Arial", fixedSize: 16))
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
            
            VStack {
                VStack(spacing: 5) {
                    Text("\(currentPrice / 100)")
                        .font(.custom("Arial", size: 12))
                        .fontWeight(.bold)
                        .padding(.horizontal, 8)
                        .padding(.top, 8)
                    
                    Text("\(currency)")
                        .font(.custom("Arial", size: 12))
                        .padding(.horizontal, 8)
                        .padding(.bottom, 8)
                    
                }
                .background(Color.pink)
                .cornerRadius(3.0)
                
                
                let timeInterval = TimeInterval(timeStamp)
                let date = Date(timeInterval: timeInterval, since: .init())
                
                Text("\(date, format: .dateTime.day().month().year())")
                    .font(.custom("Arial", size: 12))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
            }
        }
    }
}


