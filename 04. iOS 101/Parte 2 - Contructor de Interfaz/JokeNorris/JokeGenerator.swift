//
//  JokeGenerator.swift
//  ChuckNorrisLab
//
//  Created by Brian Moakley on 10/29/14.
//  Copyright (c) 2015 Razeware. All rights reserved.
//

import Foundation

class JokeGenerator {
    
    var jokes : [String: [String]]
    
    init() {
        jokes = [String:[String]]()
        
        var chuckJokes = [String]()
        chuckJokes.append("They once named a street after Chuck Norris, but they had to close it down because no one dared cross Chuck Norris.")
        chuckJokes.append("The truth hurts because Chuck Norris roundhouse kicked it.")
        chuckJokes.append("Chuck Norris doesn't cheat death, he beats it fair and square.")
        chuckJokes.append("Ghosts sit around the campfire and tell Chuck Norris stories.")
        chuckJokes.append("Chuck Norris only uses stunt doubles for crying scenes.")
        chuckJokes.append("That's not an eclipse - it’s the sun hiding from Chuck Norris.")
        
        var knockKnockJokes = [String]()
        knockKnockJokes.append("Knock, Knock! Who's there? Says! Says who? Says me, that's who?")
        knockKnockJokes.append("Knock, Knock! Who's there? Cows go. Cows go who? No, cows go moo!")
        knockKnockJokes.append("Knock, Knock! Who's there? Spell. Spell who? OK, W_H_O.")
        knockKnockJokes.append("Knock, Knock! Who's there? Otto. Otto who? Otto know. I’ve got amnesia.")
        knockKnockJokes.append("Knock, Knock! Who's there? A herd. A herd who? A herd you were home, so I came over!")
        knockKnockJokes.append("Knock, Knock! Who's there? Dwayne. Dwayne who? Dwayne the bathtub, It’s overflowing!")
        
        var silly = [String]()
        silly.append("What’s red and bad for your teeth? A brick.")
        silly.append("What’s a bagel that can fly? A plain bagel.")
        silly.append("What did zero say to 8? Nice belt!")
        silly.append("Why did the belt get arrested? He held up a pair of pants.")
        silly.append("What do you call a fake noodle? An impasta.")
        silly.append("How do crazy people go through the forest? They take the psycho path.")
        
        jokes["Chuck"] = chuckJokes
        jokes["Knock"] = knockKnockJokes
        jokes["Silly"] = silly
        
    }
    
    func randomJoke(type:String) -> String {
        
        var randomJoke = ""
        if let myJokes = jokes[type] {
            let randomIndex = Int(arc4random()) % myJokes.count
            randomJoke = myJokes[randomIndex]
        } else {
            randomJoke = "Choose one of the following: Chuck, Knock, or Silly"
        }
        return randomJoke
    }
    
}

