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
        getQuestion(previousQuestion: nil)
        setBackgroundColor(previousColor: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next(_ sender: UIButton) {
        getQuestion(previousQuestion: self.buttonLabel.currentTitle)
        setBackgroundColor(previousColor: self.view.backgroundColor)
        
    }

}

extension MainViewController {
    func getQuestion(previousQuestion: String?) {
        let randomIndex = Int(arc4random_uniform(UInt32(questions.count)))
            
        let question = questions[randomIndex]
        if question == previousQuestion {
            getQuestion(previousQuestion: previousQuestion)
        }
        
        //let attributedString = NSAttributedString(string: question, attributes: <#T##[String : Any]?#>)

        
        self.updateQuestionLabel(withCurrentQuestion: question)
    }

    func setBackgroundColor(previousColor: UIColor?) {
        let randomIndex = Int(arc4random_uniform(UInt32(backgroundColors.count)))
        let color = backgroundColors[randomIndex]
        
        if color == previousColor {
            setBackgroundColor(previousColor: color)
        }
        self.view.backgroundColor = color
    }
    func updateQuestionLabel(withCurrentQuestion question: String) {
        questionLabel.text = question
    }
    func updateQuestionLabel(withCurrentQuestion question: String) {
        questionLabel.text = question
    }

}

