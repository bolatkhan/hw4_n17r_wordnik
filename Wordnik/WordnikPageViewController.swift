//
//  WordnikPageViewController.swift
//  Wordnik
//
//  Created by user on 13.06.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit

class WordnikPageViewController: UIPageViewController {
    
    var words: [String]!
    
    var word: String! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if words.first != nil{
            
            setViewControllers([self.newContentViewController(0)],
                               direction: UIPageViewControllerNavigationDirection.Forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    
    
    func newContentViewController(index: Int) -> ContentViewController {
        let contentViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
            contentViewController.synonym = words[index]
        
            contentViewController.index = index
            contentViewController.number = words.count
            
            return contentViewController
        
    }
}

extension WordnikPageViewController: UIPageViewControllerDataSource{
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let contentVC = viewController as! ContentViewController
        word = contentVC.synonym
        
        guard let viewControllerIndex = words.indexOf(word) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let contentViewControllerCount = words.count
        
        guard contentViewControllerCount != nextIndex else {
            return nil
        
        }
        
        guard contentViewControllerCount > nextIndex else {
            return nil
        }
        
        return newContentViewController(nextIndex)
        
        
      
        
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let  contentVC = viewController as! ContentViewController
        let word = contentVC.synonym
        
        guard let viewControllerIndex = words.indexOf(word) else {
            return nil
        }
        
        let previouseIndex = viewControllerIndex - 1
        
        guard previouseIndex >= 0 else {
            return nil
        }
        guard  words.count > previouseIndex else {
            return nil
        }
        
        return newContentViewController(previouseIndex)
        
    }
    
  
    
   
}