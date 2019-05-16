//
//  QuestionsViewController.swift
//  TestQuestions
//
//  Created by Di Gain on 07/05/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

/// Question Screen

class QuestionsViewController: UIViewController {
    
// MARK: - IB Outlets
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multiLabels: [UILabel]!
    @IBOutlet var multiSwitches: [UISwitch]!
    
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
// MARK: - Stored Properties
    var questions = Question.loadData()
    var questionIndex = 0
    var answerChecked = [Answer]()
}

// MARK: - IB Actions

extension QuestionsViewController {
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
        let answer = currentAnswers[buttonIndex]
        answerChecked.append(answer)
        
        nextQuestion()
    }
    
    @IBAction func multiAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        for (multiSwitch, answer) in zip(multiSwitches, currentAnswers) {
            if multiSwitch.isOn {
                answerChecked.append(answer)
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answerChecked.append(currentAnswers[index])
        
        nextQuestion()
    }
}

// MARK: - Navigation

extension QuestionsViewController {
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  segue.identifier == "ResultSegue" else { return }
        guard let destination = segue.destination as? ResultViewController else { return }
        destination.responses = answerChecked
    }
}


// MARK: - UIVC Methods

extension QuestionsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        adjustFontSizeButtons()
    }
}
    
    
// MARK: - User Interface
    extension QuestionsViewController {
        func adjustFontSizeButtons() {
            for button in singleButtons {
                button.titleLabel?.numberOfLines = 0
                button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
                button.titleLabel?.textAlignment = NSTextAlignment.center
            }
        }
        
        func updateUI() {
            for stackView in [singleStackView, multipleStackView, rangedStackView] {
                stackView?.isHidden = true
            }
            
            let currentQuestion = questions[questionIndex]
            
            questionLabel.text = currentQuestion.text
            
            let currentAnswer = currentQuestion.answers
            
            let totalProgress = Float(questionIndex) / Float(questions.count)
            
            questionProgressView.setProgress(totalProgress, animated: true)
            
            navigationItem.title = "Question № \(questionIndex + 1) out of \(questions.count)"
            
        switch currentQuestion.type {
            case .single:
                updateSingleStack(using: currentAnswer)
            case .multiple:
                updateMultipleStack(using: currentAnswer)
            case .ranged:
                updateRangedStack(using: currentAnswer)
            }
        }
        
        func updateSingleStack(using answers: [Answer]) {
            
            singleStackView.isHidden = false
            
            for (button, answer) in zip (singleButtons, answers) {
                button.setTitle(answer.text, for: [])
            }
        }
        
        func updateMultipleStack(using answers: [Answer]) {
            
            multipleStackView.isHidden = false
            
            for (label, answer) in zip (multiLabels, answers) {
                label.text = answer.text
            }
        }
        
        func updateRangedStack(using answers: [Answer]) {
            
            rangedStackView.isHidden = false
            
            rangedLabels.first?.text = answers.first?.text
            rangedLabels.last?.text = answers.last?.text
        }
    }





   

