//
//  ViewController.swift
//  tipCalculator
//
//  Created by Hun Jae Lee on 5/27/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	// MARK: Outlets
	@IBOutlet var billAmountField: UITextField!
	@IBOutlet var roundUpSwitch: UISwitch!
	@IBOutlet var tipSlider: UISlider!
	@IBOutlet var totalField: UITextField!
	@IBOutlet var tipAmountLabel: UILabel!
	@IBOutlet var tipAmountField: UITextField!
	
	/// Shortcut for the singleton model
	var calculator = CalculatorModel.sharedInstance

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: Actions
	
	@IBAction func billAmountEntered(sender: UITextField) {
		updateAndShowTotalAmount()
	}

	@IBAction func roundUpSwitchValueChanged(sender: UISwitch) {
		calculator.roundUp = roundUpSwitch.on
		
		updateAndShowTotalAmount()
	}
	
	@IBAction func tipAmountSliderSlid(sender: UISlider) {
		calculator.tipPercentage = Int(tipSlider.value)
		tipAmountLabel.text = String(Int(tipSlider.value)) + "%"
		updateAndShowTotalAmount()
	}
	
	// MARK: Internal Calling Functions
	private func updateAndShowTotalAmount() {
		if let b = Double(billAmountField.text!) {
			calculator.billAmount = b
		}
		
		calculator.calculateAndSetTotalAmount(Double(tipSlider.value))
		tipAmountField.text = String(format: "%.2f", calculator.totalAmount - calculator.billAmount)
		totalField.text = String(format: "%.2f", calculator.totalAmount)
		
		
	}
}

