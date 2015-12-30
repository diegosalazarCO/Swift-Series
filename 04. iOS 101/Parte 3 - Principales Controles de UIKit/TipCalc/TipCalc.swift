//
//  TipCalc.swift
//  TipCalc
//
//  Created by Diego Salazar on 12/29/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import Foundation

class TipCalculator {
    
    var total: Float = 0
    var totalPerPerson: Float = 0
    var tipAmount: Float = 0
    var amountBeforeTax: Float = 0
    var tipPercentage: Float = 0
    var people:Int = 1


    init(amountBeforeTax: Float, tipPercentage: Float) {
        
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }

    func calculateTip() {
        tipAmount = amountBeforeTax * tipPercentage
    }
    
    func calculateTotalPerPerson() {
        totalPerPerson = total / Float(people)
    }
    
    func calculateTotal() {
        total = amountBeforeTax + tipAmount
    }
}