//
//  ViewController.swift
//  Wordnik
//
//  Created by user on 13.06.16.
//  Copyright © 2016 Roborzoid. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON



class ViewController: UIViewController {

    
    @IBOutlet weak var textField2: UITextField!
    var words = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    

   
    @IBAction func luckyButton(sender: UIButton) {
        
        guard textField2.text!.characters.count > 0 else {
            // alert - please enter word
            return
        }
        
        
        let url = "http://api.wordnik.com:80/v4/word.json/\(textField2.text!)/relatedWords?useCanonical=false&relationshipTypes=synonym&limitPerRelationshipType=10&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5"
        
        downloadWords(url)
    }
    
    func downloadWords(url: String){
        
    
        
        Alamofire.request(.GET, url).validate().responseJSON { response in
                switch response.result {
                case .Success:
                    print("Validation Successful")
                    
                    if let value = response.result.value {
                        let json = JSON(value)
                        print(json)
                        
                        self.words = []	
                        
                        for word in json.arrayValue{
                            for synonym in word["words"].arrayValue {
                                print("word is : \(synonym.stringValue)" )
                                self.words.append(synonym.stringValue)
                            }
                        }
                        
                        self.performSegueWithIdentifier("SegueWordnikVC", sender: nil)
                        
                        
                    }
                    
                case .Failure(let error):
                    print(error)
                }
        }
    
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SegueWordnikVC" {
            let wordnikVC = segue.destinationViewController as! WordnikViewController
            wordnikVC.words = self.words
        
        }
    }
    

}

