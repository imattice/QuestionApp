//
//  ViewController.swift
//  Nice to Meet You
//
//  Created by Ike Mattice on 1/2/17.
//  Copyright © 2017 Ike Mattice. All rights reserved.
//

import UIKit
import CoreGraphics

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
        
//        let bottomContstraint = NSLayoutConstraint(item: buttonLabel,
//                                                   attribute: NSLayoutAttribute.bottomMargin,
//                                                   relatedBy: NSLayoutRelation.equal,
//                                                   toItem: view,
//                                                   attribute: NSLayoutAttribute.bottom,
//                                                   multiplier: 1,
//                                                   constant: 140)
//        let widthConstraint = NSLayoutConstraint(item: buttonLabel,
//                                                attribute: NSLayoutAttribute.width,
//                                                relatedBy: NSLayoutRelation.equal,
//                                                toItem: nil,
//                                                attribute: NSLayoutAttribute.notAnAttribute,
//                                                multiplier: 1,
//                                                constant: 110)
//        let heightConstraint = NSLayoutConstraint(item: buttonLabel,
//                                                  attribute: NSLayoutAttribute.height,
//                                                  relatedBy: NSLayoutRelation.equal,
//                                                  toItem: nil,
//                                                  attribute: NSLayoutAttribute.notAnAttribute,
//                                                  multiplier: 1,
//                                                  constant: 40)
//        let centerConstraint = NSLayoutConstraint(item: buttonLabel,
//                                                  attribute: NSLayoutAttribute.centerX,
//                                                  relatedBy: NSLayoutRelation.equal,
//                                                  toItem: view,
//                                                  attribute: NSLayoutAttribute.centerX,
//                                                  multiplier: 1,
//                                                  constant: 0)
//        
//        buttonLabel.translatesAutoresizingMaskIntoConstraints = false
//        buttonLabel.addConstraints([bottomContstraint, widthConstraint, heightConstraint, centerConstraint])
        
        
        //update
        getQuestion(previousQuestion: nil, animated: false)
        setBackgroundColor(previousColor: nil, animated: false)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func next(_ sender: UIButton) {
        getQuestion(previousQuestion: self.questionLabel.text, animated: true)
        setBackgroundColor(previousColor: self.view.backgroundColor, animated: true)
        
    }

}

extension MainViewController {
    func getQuestion(previousQuestion: String?, animated: Bool) {
        let randomIndex = Int(arc4random_uniform(UInt32(sessionQuestions.count)))
            
        let question = sessionQuestions[randomIndex]
        //if question was the previous question, choose a new question
        if previousQuestion != nil, question == previousQuestion {
            print("question was the same")
            getQuestion(previousQuestion: previousQuestion, animated: animated)
        } else {
            sessionQuestions.remove(at: randomIndex)
            if sessionQuestions.count == 0 {
                sessionQuestions = questions
                print("questions refreshed")
            }
            self.updateQuestionLabel(withCurrentQuestion: question, animated: animated)
        }
    }

    func setBackgroundColor(previousColor: UIColor?, animated: Bool) {
        let randomIndex = Int(arc4random_uniform(UInt32(backgroundColors.count)))
        let color = backgroundColors[randomIndex]
        
        if previousColor != nil, color == previousColor! {
            print("color was the same")
            setBackgroundColor(previousColor: color, animated: animated)
        } else {
            if animated {
            UIView.animate(withDuration: 0.1, animations: {
                self.view.backgroundColor = color
            }, completion: nil)
            } else {
                self.view.backgroundColor = color
            }
        }
    }
    func getBackgroundComplimentColor() -> UIColor {
        let color = UIColor()
        
        return color
    }
    func updateQuestionLabel(withCurrentQuestion question: String, animated: Bool) {
        let textShadow = NSShadow()
            textShadow.shadowBlurRadius = 2
            textShadow.shadowOffset = CGSize(width: 3, height: 3)
            textShadow.shadowColor = UIColor.gray

        
        let attributes = [
            NSFontAttributeName: UIFont.systemFont(ofSize: 24.0),
            NSForegroundColorAttributeName: UIColor.white,
            NSShadowAttributeName: textShadow
        ]
        let attributedQuestion = NSAttributedString(string: question,
                                                    attributes: attributes)
            questionLabel.attributedText = attributedQuestion
        
            questionLabel.transform = questionLabel.transform.scaledBy(x: 0.9, y: 0.9)
        if animated {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.1,
                           initialSpringVelocity: 1.0,
                           options: [.curveEaseInOut],
                           animations: {
                                //self.questionLabel.frame = originalFrame
                            self.questionLabel.transform = self.questionLabel.transform.scaledBy(x: 1.1, y: 1.1)

                            }, completion: nil  )
        }
        
    }

}

