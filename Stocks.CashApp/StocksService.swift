//
//  StocksService.swift
//  Stocks.CashApp
//
//  Created by Olimpia Compean on 9/6/24.
//

import Foundation

struct Stock: Codable {
    let stocks: [StockItems]
    
    struct StockItems: Codable, Hashable {
        let ticker: String
        let name: String
        let currency: String
        let current_price_cents: Int
        let quantity: Int?
        let current_price_timestamp: Int
    }
}

protocol JSONServiceProtocol {
    func fetchStocks(completion: @escaping (Result<Stock, Error>) -> Void)
}

struct StockClientService: JSONServiceProtocol {
    
    private let url = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json"
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchStocks(completion: @escaping (Result<Stock, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        
        urlSession.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            do {
                guard let data = data else { return }
                let stock = try JSONDecoder().decode(Stock.self, from: data)
                completion(.success(stock))
            } catch let error {
                completion(.failure(error))
            }
        }
        .resume()
    }
}
