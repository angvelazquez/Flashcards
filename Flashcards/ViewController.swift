//
//  ViewController.swift
//  Flashcards
//
//  Created by Angel Velazquez on 2/15/20.
//  Copyright © 2020 Angel Velazquez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    @IBOutlet var myWholeView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        //card.clipsToBounds = true
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.7
        btnOptionOne.layer.borderWidth = 3.0
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        btnOptionOne.layer.cornerRadius = 20.0
        
        btnOptionTwo.layer.borderWidth = 3.0
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        btnOptionTwo.layer.cornerRadius = 20.0
        
        btnOptionThree.layer.borderWidth = 3.0
        btnOptionThree.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        btnOptionThree.layer.cornerRadius = 20.0
        
        addBtn.layer.borderWidth = 3.0
        addBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        addBtn.layer.cornerRadius = 20.0
        
    }

    @IBAction func didTapOnFlashcard(_ sender: Any)
    {
        if frontLabel.isHidden
        {
            frontLabel.isHidden = false
        }
        else
        {
            frontLabel.isHidden = true
        }
    }
    
    func updateFlashcard(question: String, answer: String)
    {
        frontLabel.text = question
        backLabel.text = answer
    }
    
    @IBAction func didTapOptionOne(_ sender: Any)
    {
        btnOptionOne.isHidden = true
    }
    @IBAction func didTapOptionTwo(_ sender: Any)
    {
        frontLabel.isHidden = true
        myWholeView.backgroundColor = UIColor(patternImage: UIImage(named: "snorlaxFinal.jpg")!)
        btnOptionTwo.isHidden = true
        btnOptionOne.isHidden = true
        btnOptionThree.isHidden = true
    }
    @IBAction func didTapOptionThree(_ sender: Any)
    {
        btnOptionThree.isHidden = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
    }
    
    
}

