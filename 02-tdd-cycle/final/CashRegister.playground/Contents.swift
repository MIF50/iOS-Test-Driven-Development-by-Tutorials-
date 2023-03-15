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
        let sut = makeSUT(availableFunds: 10)
        
        sut.addItem(itemCost)
        
        XCTAssertEqual(sut.transactionTotal, itemCost)
    }
    
    func test_addItem_twoItem_addsCostToTransactionTotal() {
        let sut = makeSUT(availableFunds: 10)
        let itemCost = Decimal(42)
        let itemCost2 = Decimal(100)

        sut.addItem(itemCost)
        sut.addItem(itemCost2)
        
        XCTAssertEqual(sut.transactionTotal, itemCost + itemCost2)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(availableFunds: Decimal) -> CashRegister {
        let sut = CashRegister(availableFunds: availableFunds)
        return sut
    }

}

CashRegisterTests.defaultTestSuite.run()
