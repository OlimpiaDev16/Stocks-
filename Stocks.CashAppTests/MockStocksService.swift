//
//  MockStocksService.swift
//  Stocks.CashAppTests
//
//  Created by Olimpia Compean on 9/8/24.
//

import Foundation
@testable import Stocks_CashApp

struct MockStockService: JSONServiceProtocol {
    
    func fetchStocks(completion: @escaping (Result<Stock, NetworkError>) -> Void) {
        guard let jsonData = readLocalJson() else {
            completion(.failure(.decodingError))
            return
        }
        
        do {
            let stock = try JSONDecoder().decode(Stock.self, from: jsonData)
            completion(.success(stock))
        } catch {
            completion(.failure(.decodingError))
        }
    }
    
    func fetchEmptyJson(completion: @escaping (Result<Stock, NetworkError>) -> Void) {
        guard let jsonData = readEmptyJson() else {
            completion(.failure(.noData))
            return
        }
        
        do {
            let stock = try JSONDecoder().decode(Stock.self, from: jsonData)
            completion(.success(stock))
        } catch {
            completion(.failure(.noData))
        }
    }
    
    func fetchMalformedJson(completion: @escaping (Result<Stock, NetworkError>) -> Void) {
        guard let jsonData = readMalformedJson() else {
            completion(.failure(.badURL))
            return
        }
        
        do {
            let stock = try JSONDecoder().decode(Stock.self, from: jsonData)
            completion(.success(stock))
        } catch {
            completion(.failure(.badURL))
        }
    }
    
    func readLocalJson() -> Data? {
        guard let url = Bundle.main.url(forResource: "StocksResponse", withExtension: "json") else {
            fatalError("Local JSON file not found")
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func readEmptyJson() -> Data? {
        guard let url = Bundle.main.url(forResource: "StocksEmptyResponse", withExtension: "json") else {
            fatalError("Local JSON file not found")
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    func readMalformedJson() -> Data? {
        guard let url = Bundle.main.url(forResource: "StocksMalformedResponse", withExtension: "json") else {
            fatalError("Local JSON file not found")
        }
        do {
            let data = try Data(contentsOf: url)
            return data
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
