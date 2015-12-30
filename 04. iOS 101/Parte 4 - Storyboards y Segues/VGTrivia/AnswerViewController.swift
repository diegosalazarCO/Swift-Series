//
//  AnswerViewController.swift
//  VGTrivia
//
//  Created by Diego Salazar on 12/30/15.
//  Copyright © 2015 Diego Salazar. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    var question: Question?
    var guessedAnswer: Int?
    
    override func viewWillAppear(animated: Bool) {
        if guessedAnswer == question!.rightAnswer {
            statusLabel.text = "CORRECTO!"
        } else {
            statusLabel.text = "INCORRECTO :("
        }
        
        switch question!.rightAnswer {
        case 1:
            correctAnswerLabel.text = question?.answers[0]
        case 2:
            correctAnswerLabel.text = question?.answers[1]
        case 3:
            correctAnswerLabel.text = question?.answers[2]
        case 4:
            correctAnswerLabel.text = question?.answers[3]
        default:
            break
        }
    }

}
