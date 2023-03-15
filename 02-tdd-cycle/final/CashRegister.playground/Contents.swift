import Foundation
import XCTest

public class CashRegister {
    
    var availableFunds: Decimal = 0
    
    var transactionTotal: Decimal = 0
    
    public init(availableFunds: Decimal) {
        self.availableFunds = availableFunds
    }
    
    public func addItem(_ cost: Decimal) {
        transactionTotal = cost
    }
}

class CashRegisterTests: XCTestCase {
    
    func test_init_withAvailableFunds_setsAvailableFunds() {
        // given a certain condition
        let availableFunds = Decimal(10)
        
        // when a certain action happens
        let sut = CashRegister(availableFunds: availableFunds)
        
        // then an expected result occurs
        XCTAssertEqual(sut.availableFunds,availableFunds)
    }
    
    func test_addItem_oneItem_addsCostToTransactionTotal() {
        let availableFunds = Decimal(10)
        let sut = CashRegister(availableFunds: availableFunds)
        let itemCost = Decimal(42)
        
        sut.addItem(itemCost)
        
        XCTAssertEqual(sut.transactionTotal, itemCost)
    }
}

CashRegisterTests.defaultTestSuite.run()
