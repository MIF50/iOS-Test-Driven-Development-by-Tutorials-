import Foundation
import XCTest

public class CashRegister {
    
    var availableFunds: Decimal = 0
    
    public init(availableFunds: Decimal = 0) {
        self.availableFunds = availableFunds
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
}

CashRegisterTests.defaultTestSuite.run()
