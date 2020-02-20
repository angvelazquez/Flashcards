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
        card.layer.shadowOpacity = 0.5
        btnOptionOne.layer.borderWidth = 3.0
        btnOptionOne.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnOptionOne.layer.cornerRadius = 20.0
        
        btnOptionTwo.layer.borderWidth = 3.0
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnOptionTwo.layer.cornerRadius = 20.0
        
        btnOptionThree.layer.borderWidth = 3.0
        btnOptionThree.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        btnOptionThree.layer.cornerRadius = 20.0
        
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
}
