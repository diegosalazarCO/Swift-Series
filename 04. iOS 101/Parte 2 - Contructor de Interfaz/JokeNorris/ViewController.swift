//
//  ViewController.swift
//  ChuckNorris
//
//  Created by Brian on 8/26/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var jokeGenerator: JokeGenerator!
    
    var jokeTypes = ["ChuckNorris", "KnockKnock", "Silly"]
    
    @IBOutlet weak var jokeMainImage: UIImageView!
    @IBOutlet weak var jokeLabel: UILabel!
    @IBOutlet weak var jokeButton: UIButton!
    
    @IBAction func generatorButton(sender: UIButton) {
        jokeLabel.text = jokeGenerator.randomJoke(jokeGenerator.type)
    }
    
    @IBAction func changeSegmentJoke(sender: UISegmentedControl?) {
        let segmentedControl = sender
        if let index = segmentedControl?.selectedSegmentIndex {
            jokeMainImage.image = UIImage(named: jokeTypes[index])
            switch index {
            case 1:
                jokeGenerator.type = "Knock"
                generatorButton(jokeButton)
            case 2:
                jokeGenerator.type = "Silly"
                generatorButton(jokeButton)
            default:
                jokeGenerator.type = "Chuck"
                generatorButton(jokeButton)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        jokeGenerator = JokeGenerator()
        jokeLabel.text = ""
    }

}

