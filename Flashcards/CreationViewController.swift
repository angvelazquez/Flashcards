//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Angel Velazquez on 2/29/20.
//  Copyright © 2020 Angel Velazquez. All rights reserved.
//

import UIKit

class CreationViewController: UIViewController {

    var flashcardsController: ViewController!
    
    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        let questionText = questionTextField.text
        
        let answerText = answerTextField.text
        
        if questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty
        {
            let alert = UIAlertController(title: "Missing text", message: "You need to enter both a question and an answer", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default)
            
            alert.addAction(okAction)
            
            present(alert, animated: true)
        }
        else
        {
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
            
            dismiss(animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
