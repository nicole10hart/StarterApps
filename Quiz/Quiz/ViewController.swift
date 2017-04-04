//
//  ViewController.swift
//  Quiz
//
//  Created by Hart, Nicole on 4/3/17.
//  Copyright © 2017 BigNerdRanch. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var currentQuestionLabelXConstraint: NSLayoutConstraint!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelXConstraint: NSLayoutConstraint!
    
    var currentQuestionIndex = 0
    
    let questions = ["What country was Albert Einstein asked to be president of?",
                     "Who is the only female artist who had 5 song from the same album reach Number One?",
                     "Who is the only cartoon character to be on the 100 Most Influential People list?"]
    
    let answers = ["Israel", "Katy Perry", "Homer Simpson"]
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        nextQuestionLabel.text = questions[currentQuestionIndex]
        answerLabel.text = "???"
        
        animatedLabelTransitions()
    }
    
    @IBAction func showAnswer(_ sender: UIButton){
        answerLabel.text = answers[currentQuestionIndex]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentQuestionLabel.text = questions[currentQuestionIndex]
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelXConstraint.constant = -screenWidth
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animatedLabelTransitions() {
        view.layoutIfNeeded()
        let screenWidth = view.frame.width
        self.nextQuestionLabelXConstraint.constant = 0
        self.currentQuestionLabelXConstraint.constant += screenWidth
        UIView.animate(withDuration: 0.5, animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
        })
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: [.curveLinear], animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: {_ in swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
            swap(&self.currentQuestionLabelXConstraint, &self.nextQuestionLabelXConstraint)
        self.updateOffScreenLabel()
        })
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0
    }

}

