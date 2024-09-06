//
//  StocksModel.swift
//  Stocks.CashApp
//
//  Created by Olimpia Compean on 9/6/24.
//

import Foundation
import SwiftUI

class StockViewModel: ObservableObject {
    
    var stock: [Stock.StockItems] = []
    
    private let service: JSONServiceProtocol
    
    init(service: JSONServiceProtocol = StockClientService()) {
        self.service = service
        print("OC \(stock.count)")
        getStocks()
    }
    
    private func getStocks() {
        service.fetchStocks { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let stock):
                self.stock = stock.stocks
            case .failure(let error):
                print("Error retriving stocks: \(error.localizedDescription)")

            }
        }
    }
}
