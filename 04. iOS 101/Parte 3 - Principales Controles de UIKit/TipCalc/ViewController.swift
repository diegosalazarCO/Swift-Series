//
//  ViewController.swift
//  TipCalc
//
//  Created by Brian on 8/27/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate {
    
    let tipCalc = TipCalculator(amountBeforeTax: 0.00, tipPercentage: 0.2)
    var textFields: [UITextField]!

    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var amountBeforeTaxField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBAction func tipSliderCalculation(sender: UISlider?) {
        let slider = sender
        percentageLabel.text = String(Int(slider!.value * 100)) + "%"
        calcTip()
        calcTotalPerPerson()
    }
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var people = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    override func viewDidLoad() {
        super.viewDidLoad()

        amountBeforeTaxField.text = String(format: "%0.2f",
            arguments: [tipCalc.amountBeforeTax])
        textFields = [amountBeforeTaxField]
        amountBeforeTaxField.delegate = self
        
        pickerView.tintColor = UIColor.whiteColor()

    }
    
    func calcTip() {
            tipCalc.tipPercentage = round(100 * tipPercentageSlider.value) / 100
            tipCalc.amountBeforeTax = (amountBeforeTaxField.text! as
            NSString).floatValue
            tipCalc.calculateTip()
            tipAmountLabel.text = String(format: "$%0.2f", arguments:
            [tipCalc.tipAmount])
    }
    
    func calcTotalPerPerson() {
                tipCalc.calculateTotal()
            tipCalc.calculateTotalPerPerson()
                totalPerPerson.text = String(format: "$%0.2f", arguments:
                [tipCalc.totalPerPerson])
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        calcTip()
        calcTotalPerPerson()
        return true
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return people.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return people[row]
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = people[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSFontAttributeName:UIFont(name: "Helvetica", size: 28.0)!,NSForegroundColorAttributeName:UIColor.whiteColor()])
        return myTitle
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tipCalc.people = Int(people[row])!
        calcTotalPerPerson()
    }

}

