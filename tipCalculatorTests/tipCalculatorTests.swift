//
//  tipCalculatorTests.swift
//  tipCalculatorTests
//
//  Created by Hun Jae Lee on 5/27/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import XCTest
@testable import tipCalculator

class tipCalculatorTests: XCTestCase {
	let calculator = CalculatorModel.sharedInstance

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNominalCase() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		
		calculator.billAmount = 100.00
		let tipPercentage = 20.0
		
		// this should make the code coverage mad
		calculator.roundUp = false
		
		
		calculator.calculateAndSetTotalAmount(tipPercentage)
		XCTAssert(calculator.totalAmount == 120.00, "total amount should be calculated correctly")
    }
	
	
	func testRoundingCase() {
		calculator.billAmount = 100.00
		let tipPercentage = 0.1
		calculator.roundUp = true
		calculator.calculateAndSetTotalAmount(tipPercentage)
		XCTAssert(calculator.totalAmount == 101.00, "total amount should be calculated correctly")
	}

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
			self.calculator.billAmount = 100.00
			let tipPercentage = 20.0
			self.calculator.calculateAndSetTotalAmount(tipPercentage)
        }
    }

	
}
