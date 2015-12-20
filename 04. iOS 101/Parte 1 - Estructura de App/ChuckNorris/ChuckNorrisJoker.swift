//
//  ChuckNorrisJoker.swift
//  ChuckNorris
//
//  Created by Diego Salazar on 12/20/15.
//  Copyright © 2015 Razeware. All rights reserved.
//

import Foundation

class ChuckNorrisJoker {
    var jokes: [String] = [
        "Chuck Norris has already been to Mars; that's why there are no signs of life.",
        "When Alexander Bell invented the telephone he had 3 missed calls from Chuck Norris",
        "There used to be a street named after Chuck Norris, but it was changed because nobody crosses Chuck Norris and lives.",
        "Chuck Norris died 20 years ago, Death just hasn't built up the courage to tell him yet.",
        "Chuck Norris counted to infinity - twice.",
        "Chuck Norris is the reason why Waldo is hiding.",
        "Chuck Norris once urinated in a semi truck's gas tank as a joke....that truck is now known as Optimus Prime.",
        "Chuck Norris can slam a revolving door.",
        "Chuck Norris doesn't flush the toilet, he scares the sh*t out of it",
        "Chuck Norris once kicked a horse in the chin. Its decendants are known today as Giraffes.",
        "Chuck Norris can cut through a hot knife with butter",
        "Chuck Norris can win a game of Connect Four in only three moves.",
        "Chuck Norris once got bit by a rattle snake........ After three days of pain and agony ..................the rattle snake died",
        "Chuck Norris will never have a heart attack. His heart isn't nearly foolish enough to attack him.",
        "There is no theory of evolution. Just a list of animals Chuck Norris allows to live.",
        "When Chuck Norris does a pushup, he isn't lifting himself up, he's pushing the Earth down."
    ]
    
    func showRandomJoke() -> String {
        let randomJokeInArray = Int(arc4random_uniform(UInt32(jokes.count)))
        return jokes[randomJokeInArray]
    }
}