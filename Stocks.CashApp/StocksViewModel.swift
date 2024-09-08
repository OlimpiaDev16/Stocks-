//
//  StocksModel.swift
//  Stocks.CashApp
//
//  Created by Olimpia Compean on 9/6/24.
//

import Foundation
import SwiftUI

// Make a note: Why main actor doesnt work here
//@MainActor
class StockViewModel: ObservableObject {
  
    enum State {
        case loading
        case failed(Error)
        case loaded(Stock)
    }
    
    @Published private(set) var state = State.loading
    private let service: JSONServiceProtocol
    var stock: [Stock.StockItems] = []
    
    init(service: JSONServiceProtocol = StockClientService()) {
        self.service = service
    }
    
    func loadStocks() {
        self.service.fetchStocks { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let stock):
                    self?.state = .loaded(stock)
                case .failure(let error):
                    self?.state = .failed(error)
                }
            }
        }
    }
}
