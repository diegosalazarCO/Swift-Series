//
//  ViewController.swift
//  ScaryBugs
//
//  Created by Diego Salazar on 1/18/16.
//  Copyright © 2016 Diego Salazar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var bugs = [ScaryBug]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bugs = ScaryBug.bugs()
        automaticallyAdjustsScrollViewInsets = false
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bugs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("BugCell", forIndexPath: indexPath)
        let bug = bugs[indexPath.row]
        
        cell.textLabel?.text = bug.name
        cell.detailTextLabel?.text = ScaryBug.scaryFactorToString(bug.howScary)
        
        if let imageView = cell.imageView, bugImage = bug.image {
            imageView.image = bugImage
        }
        
        return cell
    }
    
    


}

