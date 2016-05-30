//
//  CalculatorModel.swift
//  tipCalculator
//
//  Created by Hun Jae Lee on 5/27/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import Foundation

class CalculatorModel {
	/// The singleton model for this Tip Calculator.
	static let sharedInstance = CalculatorModel()
	
	/// The amount of bill that you received.
	var billAmount: Double
	
	/// The percentage of the tip you would like to give. Default value is 20(%).
	var tipPercentage: Int = 20
	
	/// The calculated total amount that you will be paying.
	var totalAmount: Double
	
	/// Whether you want to round up the total amount to a full dollar.
	var roundUp: Bool?
	
	/// This will make code coverage test mad
	var someBoolean = false
	
	private init() {
		billAmount = 0.0
		totalAmount = 0.0
	}
	
	/**
	Calculates the total amount of money to be paid.
	
	- Parameter tipPercentage: the tip percentage to give.
	- Parameter roundUp: whether to round up to full dollar.
	
	- Returns: the total amount of money to be paid.
	*/
	func calculateAndSetTotalAmount(tipPercentage: Double) {
		totalAmount = billAmount + (billAmount * Double(tipPercentage / 100))
		if roundUp! {
			totalAmount = ceil(totalAmount)
		}
		
		if roundUp! && someBoolean {
			print("code coverage!?")
		}
	}
}