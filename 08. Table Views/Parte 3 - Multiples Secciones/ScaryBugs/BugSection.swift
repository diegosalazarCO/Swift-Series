//
//  BugSection.swift
//  ScaryBugs
//
//  Created by Diego Salazar on 1/19/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import Foundation

class BugSection {
    
    let howScary: ScaryFactor
    let bugs = [ScaryBug]()
    
    
    init(howScary: ScaryFactor) {
        self.howScary = howScary
    }
}