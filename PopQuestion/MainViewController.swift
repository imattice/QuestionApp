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

    var sessionQuestions: [String] = questions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 //       let button = UIButton(frame: CGRect(x: 0, y: 0, width: 110, height: 55))
 //           button.setTitle("Next", for: .normal)
 //           button.set
        
//        self.view.addSubview(button)
        
        
        getQuestion(previousQuestion: nil)
        setBackgroundColor(previousColor: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next(_ sender: UIButton) {
        getQuestion(previousQuestion: self.questionLabel.text)
        setBackgroundColor(previousColor: self.view.backgroundColor)
        
    }

}

extension MainViewController {
    func getQuestion(previousQuestion: String?) {
        let randomIndex = Int(arc4random_uniform(UInt32(sessionQuestions.count)))
            
        let question = sessionQuestions[randomIndex]
        //if question was the previous question, choose a new question
        if previousQuestion != nil, question == previousQuestion {
            print("question was the same")
            getQuestion(previousQuestion: previousQuestion)
        } else {
            sessionQuestions.remove(at: randomIndex)
            if sessionQuestions.count == 0 {
                sessionQuestions = questions
                print("questions refreshed")
            }
            self.updateQuestionLabel(withCurrentQuestion: question)
        }
    }

    func setBackgroundColor(previousColor: UIColor?) {
        let randomIndex = Int(arc4random_uniform(UInt32(backgroundColors.count)))
        let color = backgroundColors[randomIndex]
        
        if previousColor != nil, color == previousColor! {
            print("color was the same")
            setBackgroundColor(previousColor: color)
        } else {
            self.view.backgroundColor = color
        }
    }
    func getBackgroundComplimentColor() -> UIColor {
        let color = UIColor()
        
        return color
    }
    func updateQuestionLabel(withCurrentQuestion question: String) {
        let textShadow = NSShadow()
            textShadow.shadowBlurRadius = 2
            textShadow.shadowOffset = CGSize(width: 3, height: 3)
            textShadow.shadowColor = UIColor.gray

        let attributes = [
            NSFontAttributeName: UIFont.systemFont(ofSize: 24.0),
            NSForegroundColorAttributeName: UIColor.white,
            NSShadowAttributeName: textShadow
        ]
        let attributedQuestion = NSAttributedString(string: question, attributes: attributes)
        questionLabel.attributedText = attributedQuestion
    }
//    func updateQuestionLabel(withCurrentQuestion question: String) {
//        questionLabel.text = question
//    }

}

