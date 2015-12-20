//
//  ViewController.swift
//  ChuckNorris
//
//  Created by Brian on 8/26/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let joke = ChuckNorrisJoker()
        print(joke.showRandomJoke())
    }

}

