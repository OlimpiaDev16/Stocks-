//
//  StocksModel.swift
//  Stocks.CashApp
//
//  Created by Olimpia Compean on 9/6/24.
//

import Foundation
import SwiftUI

class StockViewModel: ObservableObject {
    
    private let service: JSONServiceProtocol
    var stock: [Stock.StockItems] = []
    
    init(service: JSONServiceProtocol = StockClientService()) {
        self.service = service
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
