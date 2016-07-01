//
//  WordnikViewController.swift
//  Wordnik
//
//  Created by user on 13.06.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit

class WordnikViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    var words: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeButton(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let wordnikVC = segue.destinationViewController as? WordnikPageViewController {
            wordnikVC.words = self.words
            
        }
    }

}
