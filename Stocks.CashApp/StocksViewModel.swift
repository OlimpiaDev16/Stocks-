//
//  StocksModel.swift
//  Stocks.CashApp
//
//  Created by Olimpia Compean on 9/6/24.
//

import Foundation
import SwiftUI

class StockViewModel: ObservableObject {
    
    enum State {
        case loading
        case loaded(Stock)
        case badURL(Error)
        case emptyURL
    }
    
    @Published var state = State.loading
    @Published var stock: [Stock.StockItems] = []
    private let service: JSONServiceProtocol
    
    init(service: JSONServiceProtocol = StockNetworkService()) {
        self.service = service
    }
    
    func loadStocks() {
        self.service.fetchStocks { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let stock):
                    if stock.stocks.isEmpty {
                        self?.state = .emptyURL
                    } else {
                        self?.state = .loaded(stock)                        
                    }
                case .failure(let error):
                    self?.state = .badURL(error)
                }
            }
        }
    }
}
