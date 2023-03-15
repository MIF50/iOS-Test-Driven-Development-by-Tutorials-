import Foundation
import XCTest

public class CashRegister {
    
    var availableFunds: Decimal
    var transactionTotal: Decimal = 0
    
    public init(availableFunds: Decimal) {
        self.availableFunds = availableFunds
    }
    
    public func addItem(_ cost: Decimal) {
        transactionTotal += cost
    }
    
    public func acceptCashPayment(_ cash: Decimal) {
        availableFunds += cash
        transactionTotal -= cash
    }
}

class CashRegisterTests: XCTestCase {
    
    // given a certain condition
    // when a certain action happens
    // then an expected result occurs
    
    func test_init_withAvailableFunds_setsAvailableFunds() {
        let availableFunds: Decimal = 42
        let sut = makeSUT(availableFunds: availableFunds)

        XCTAssertEqual(sut.availableFunds,availableFunds)
    }
    
    func test_addItem_oneItem_addsCostToTransactionTotal() {
        let itemCost = Decimal(42)
        let sut = makeSUT()
        
        sut.addItem(itemCost)
        
        XCTAssertEqual(sut.transactionTotal, itemCost)
    }
    
    func test_addItem_twoItem_addsCostToTransactionTotal() {
        let sut = makeSUT()
        let itemCost = Decimal(42)
        let itemCost2 = Decimal(100)

        sut.addItem(itemCost)
        sut.addItem(itemCost2)
        
        XCTAssertEqual(sut.transactionTotal, itemCost + itemCost2)
    }
    
    func test_acceptCashPayment_subtractsPaymentFromTransactionTotal() {
        let sut = makeSUT()
        let itemCost = Decimal(150)
        sut.addItem(itemCost)
        
        let cash = Decimal(100)
        sut.acceptCashPayment(cash)
        
        XCTAssertEqual(sut.transactionTotal, itemCost - cash)
    }
    
    func test_acceptCashPayment_addsPaymentFromAvailableFunds() {
        let availableFunds = Decimal(42)
        let sut = makeSUT(availableFunds: availableFunds)
        
        let cash = Decimal(100)
        sut.acceptCashPayment(cash)
        
        XCTAssertEqual(sut.availableFunds, availableFunds + cash)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(availableFunds: Decimal = 0) -> CashRegister {
        let sut = CashRegister(availableFunds: availableFunds)
        return sut
    }
}

CashRegisterTests.defaultTestSuite.run()
