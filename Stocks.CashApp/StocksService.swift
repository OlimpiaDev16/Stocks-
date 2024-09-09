//
//  StocksService.swift
//  Stocks.CashApp
//
//  Created by Olimpia Compean on 9/6/24.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
    case APIError(String)
}

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
    func fetchStocks(completion: @escaping (Result<Stock, NetworkError>) -> Void)
}

struct StockNetworkService: JSONServiceProtocol {
    
    private let url = "https://storage.googleapis.com/cash-homework/cash-stocks-api/portfolio.json"
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func fetchStocks(completion: @escaping (Result<Stock, NetworkError>) -> Void) {
        guard let url = URL(string: url) else { return }
        urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.badURL))
            }
            do {
                guard let data = data else { return }
                let stock = try JSONDecoder().decode(Stock.self, from: data)
                completion(.success(stock))
            } catch {
                completion(.failure(.decodingError))
            }
        }
        .resume()
    }
}
