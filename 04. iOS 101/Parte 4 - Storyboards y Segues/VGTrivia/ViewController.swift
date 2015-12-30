//
//  ViewController.swift
//  VGTrivia
//
//  Created by Diego Salazar on 12/30/15.
//  Copyright © 2015 Diego Salazar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answersButtons: [UIButton]!

    @IBAction func answerButtonTapped(sender: AnyObject) {
        performSegueWithIdentifier("Display Answer", sender: sender)
    }
    
    @IBAction func close(segue:UIStoryboardSegue) { }
    
    var questions: [Question]!
    var currQuestion: Question!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let question1 = Question(question: "Which character was a twin in Final Fantasy II?", answer1: "Cecil", answer2: "Kain", answer3: "Palom", answer4: "Tellah", rightAnswer:3)
        let question2 = Question(question: "Which of these people was a game designer for Deus Ex?", answer1: "JC Denton", answer2: "Shigeru Miyamoto", answer3: "Matt Rix", answer4: "Warren Spector", rightAnswer: 4)
        let question3 = Question(question: "Which of these items was commonly used as currency in Diablo 2?", answer1: "Stone of Jordan", answer2: "Duck of Doom", answer3: "Ethereal Shard", answer4: "Tower Bux", rightAnswer: 1)
        let question4 = Question(question: "Which of these was a boss in Mega Man 2?", answer1: "Snow Man", answer2: "Wood Man", answer3: "Youda Man", answer4: "Snake Man", rightAnswer: 2)
        let question5 = Question(question: "What was the job of the main character in Fallout 3 New Vegas?", answer1: "A bounty hunter", answer2: "A metalsmith", answer3: "A courier", answer4: "A plumber", rightAnswer: 3)
        questions = [question1, question2, question3, question4, question5]
    }
    
    override func viewWillAppear(animated: Bool) {
        currQuestion = questions[Int(arc4random()) % questions.count]
        questionLabel.text = currQuestion.question
            
        var index = 0
        for answer in answersButtons {
            answer.setTitle(currQuestion.answers[index], forState: .Normal)
            index += 1
        }
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Display Answer" {
            let answerViewController = segue.destinationViewController as! AnswerViewController
            let selectedAnswer = sender as! UIButton
            answerViewController.question = currQuestion!
            answerViewController.guessedAnswer = selectedAnswer.tag
        }
    }


}

