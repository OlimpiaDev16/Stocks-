//
//  StocksServiceTests.swift
//  Stocks.CashAppTests
//
//  Created by Olimpia Compean on 9/8/24.
//

import XCTest
@testable import Stocks_CashApp

final class StocksViewModelTests: XCTestCase {
    
    var viewModel: StockViewModel!
    private var mockService = MockStockService()
    
    override func setUp() {
        super.setUp()
        viewModel = StockViewModel(service: mockService)
    }
    
    func test_FetchStocks_WithSuccess() {
        mockService.fetchStocks { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let success):
                self.viewModel.stock = success.stocks
                self.viewModel.loadStocks()
                XCTAssert(!self.viewModel.stock.isEmpty)
            case .failure(_):
                break
            }
        }
    }
    
    func test_FetchStocks_WithEmptyResponse() {
        mockService.fetchEmptyJson { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let stock):
                self.viewModel.stock = stock.stocks
                self.viewModel.loadStocks()
                XCTAssert(self.viewModel.stock.isEmpty)
            case .failure(_):
                break
            }

        }
    }
    
    func test_FetchStocks_withBadURL() {
        mockService.fetchMalformedJson { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let stock):
                self.viewModel.stock = stock.stocks
                self.viewModel.loadStocks()
                XCTAssert(self.viewModel.stock.isEmpty)
            case .failure(_):
                break
            }
        }
    }
    
}
