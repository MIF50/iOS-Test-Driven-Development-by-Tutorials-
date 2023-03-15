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
    
    var availableFunds: Decimal!
    var sut: CashRegister!
    
    override func setUp() {
        super.setUp()
        
        availableFunds = 10
        sut = CashRegister(availableFunds: availableFunds)
    }
    
    override func tearDown() {
        super.tearDown()
        
        availableFunds = nil
        sut = nil
    }
    
    // given a certain condition
    // when a certain action happens
    // then an expected result occurs
    
    func test_init_withAvailableFunds_setsAvailableFunds() {
        XCTAssertEqual(sut.availableFunds,availableFunds)
    }
    
    func test_addItem_oneItem_addsCostToTransactionTotal() {
        let itemCost = Decimal(42)
        
        sut.addItem(itemCost)
        
        XCTAssertEqual(sut.transactionTotal, itemCost)
    }
}

CashRegisterTests.defaultTestSuite.run()
