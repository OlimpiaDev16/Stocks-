//
//  Mockable.swift
//  Stocks.CashAppTests
//
//  Created by Olimpia Compean on 9/8/24.
//

import Foundation

protocol Mockable: AnyObject {
    var bundle: Bundle { get }
    func loadJSON<T: Decodable>(fileName: String, type: T.Type) -> [T]
}

extension Mockable {
    var bundle: Bundle {
        return Bundle(for: type(of: self))
    }
    
    func loadJSON<T: Decodable>(fileName: String, type: T.Type) -> [T] {
        guard let path = bundle.url(forResource: fileName, withExtension: "json") else { fatalError("Failed to load JSON file")}
        
        do {
            let data = try Data(contentsOf: path)
            let decodedObject = try JSONDecoder().decode([T].self, from: data)
            return decodedObject
        } catch {
            print("Error decoding JSON")
            fatalError("Failed to decode JSON file")
        }
    }
    
  
}
