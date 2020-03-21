//
//  ViewController.swift
//  Flashcards
//
//  Created by Angel Velazquez on 2/15/20.
//  Copyright © 2020 Angel Velazquez. All rights reserved.
//

import UIKit

struct Flashcard{
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    @IBOutlet var myWholeView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    //Array to hold our flashcards
    var flashcards = [Flashcard]()
    
    var currentIndex = 0
    
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
        
        prevButton.layer.borderWidth = 3.0
        prevButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        prevButton.layer.cornerRadius = 20.0
        
        nextButton.layer.borderWidth = 3.0
        nextButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        nextButton.layer.cornerRadius = 20.0
        
        readSavedFlashcards()
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
    
    @IBAction func didTapOnDelete(_ sender: Any) {
        // Show confirmation
        let alert = UIAlertController(title: "Delete flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in self.deleteCurrentFlashcard()
        }
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func deleteCurrentFlashcard()
    {
        // Delete current
        flashcards.remove(at: currentIndex)
        
        // Special case: Check if last card was deleted
        if currentIndex > flashcards.count - 1
        {
            currentIndex = flashcards.count - 1
        }
        
        // Special case: Check if first card was deleted
        if currentIndex < 0
        {
            currentIndex = 0
        }
        
        updateNextPrevButtons()
        updateLabels()
        saveAllFlashcardsToDisk()
    }
    
    func updateFlashcard(question: String, answer: String, extraAnswerOne: String?, extraAnswerTwo: String?, extraAnswerThree: String?, isExisitng: Bool)
    {
        let flashcard = Flashcard(question: question, answer: answer)
        frontLabel.text = flashcard.question
        backLabel.text = flashcard.answer
        
        btnOptionOne.setTitle(extraAnswerOne, for: .normal)
        btnOptionTwo.setTitle(extraAnswerTwo, for: .normal)
        btnOptionThree.setTitle(extraAnswerThree, for: .normal)
        
        if isExisitng
        {
            // Replace existing flashcard
            flashcards[currentIndex] = flashcard
        }
        else
        {
        
            //Adding flashcard in the flashcards array
            flashcards.append(flashcard)
        
            currentIndex = flashcards.count - 1
            print("Added new flashcard")
            print("We now have \(flashcards.count) flashcards")
        }
        
        // Update buttons
        updateNextPrevButtons()
        
        //Update Labels
        updateLabels()
        
        //Save card into UserDefault
        saveAllFlashcardsToDisk()
        
    }
    
    @IBAction func didTapOptionOne(_ sender: Any)
    {
        btnOptionOne.isHidden = true
    }
    @IBAction func didTapOptionTwo(_ sender: Any)
    {
        frontLabel.isHidden = true
        btnOptionTwo.isHidden = true
        btnOptionOne.isHidden = true
        btnOptionThree.isHidden = true
    }
    @IBAction func didTapOptionThree(_ sender: Any)
    {
        btnOptionThree.isHidden = true
    }
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        
        //Decrease current index
        currentIndex = currentIndex - 1
        
        //Update labels
        updateLabels()
        
        //Update buttons
        updateNextPrevButtons()
    }
    
    
    @IBAction func didTapOnNext(_ sender: Any) {
        
        //Increase current index
        currentIndex = currentIndex + 1
        
        //Update labels
        updateLabels()
        
        //Update buttons
        updateNextPrevButtons()
        
    }
    
    func updateLabels()
    {
        //Get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        
        //Update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardsController = self
        if segue.identifier == "EditSegue"
        {
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
        }
    }
    
    func updateNextPrevButtons() {
        if currentIndex == flashcards.count - 1
        {
            nextButton.isEnabled = false
        }
        else
        {
            nextButton.isEnabled = true
        }
        
        if currentIndex == 0
        {
            prevButton.isEnabled = false
        }
        else
        {
            prevButton.isEnabled = true
        }
    }
    
    func saveAllFlashcardsToDisk()
    {
       // From flashcard array to dictionary array
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
        
        
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        //Log it
        print("Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards()
    {
      //Read dicitionary array from disk (if any)
      if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]
      {
        let savedCards = dictionaryArray.map { dictionary -> Flashcard in return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)}
         
        //Put all these cards in our flashcards array
        flashcards.append(contentsOf: savedCards)
      }
    }
    
}

