//
//  ContentViewController.swift
//  Wordnik
//
//  Created by user on 13.06.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var wordLabel: UILabel!
    var number: Int!
    var index: Int!
    
    
    
    
    
    
    
    var synonym: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.wordLabel.text = synonym
        
        pageControl.currentPage = index
        pageControl.numberOfPages =  number
        
    }

}
