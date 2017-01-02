//
//  ViewController.swift
//  Nice to Meet You
//
//  Created by Ike Mattice on 1/2/17.
//  Copyright © 2017 Ike Mattice. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!

    var answeredQuestions: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next(_ sender: UIButton) {
        getQuestion()
        setBackgroundColor()
        
    }

}

extension MainViewController {
    func getQuestion() {
        if questions.count == 0 { return } else {
        let randomIndex = Int(arc4random_uniform(UInt32(questions.count)))
        let question = questions[randomIndex]
        
        //select random question
        //do not reuse questions (often)
        
        self.updateQuestionLabel(withCurrentQuestion: question)
        }
    }
    func removeFromQuestionArray(atIndex index: Int) {
        questions.remove(at: index)
    }
    func setBackgroundColor() {
        
    }
    func updateQuestionLabel(withCurrentQuestion question: String) {
        questionLabel.text = question
    }
}

