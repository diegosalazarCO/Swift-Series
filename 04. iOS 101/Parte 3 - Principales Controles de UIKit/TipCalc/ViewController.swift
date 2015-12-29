//
//  ViewController.swift
//  TipCalc
//
//  Created by Brian on 8/27/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let tipCalc = TipCalculator(amountBeforeTax: 25.00, tipPercentage: 0.2)
    var textFields: [UITextField]!

    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var amountBeforeTaxField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBAction func tipSliderCalculation(sender: UISlider?) {
        let slider = sender
        percentageLabel.text = String(Int(slider!.value * 100)) + "%"
        calcTip()
    }
    @IBOutlet weak var tipPercentageSlider: UISlider!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        amountBeforeTaxField.text = String(format: "%0.2f",
            arguments: [tipCalc.amountBeforeTax])
        textFields = [amountBeforeTaxField]
        amountBeforeTaxField.delegate = self
    }
    
    func calcTip() {
            tipCalc.tipPercentage = round(100 * tipPercentageSlider.value) / 100
            tipCalc.amountBeforeTax = (amountBeforeTaxField.text! as
            NSString).floatValue
            tipCalc.calculateTip()
            tipAmountLabel.text = String(format: "Propina: $%0.2f", arguments:
            [tipCalc.tipAmount])
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        calcTip()
        
        return true
    }

}

