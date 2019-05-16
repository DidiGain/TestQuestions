//
//  ResultViewController.swift
//  TestQuestions
//
//  Created by Di Gain on 07/05/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var yogaLabel: UILabel!
    @IBOutlet weak var yogaDescription: UILabel!
    @IBOutlet weak var stylesLabel: UILabel!
    
    var responses: [Answer]!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        updateResult()
    }
}

// MARK: - Update UI
extension ResultViewController {
    func updateResult() {
        var frequencyOfAnswers = [YogaType: Int]()
        let responseType = responses.map { $0.type }
        
        for response in responseType {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let frequencyOfAnswersSorted = frequencyOfAnswers.sorted { $0.value > $1.value }
        guard let mostFrequentAnswer = frequencyOfAnswersSorted.first?.key else { return }
        
        updateUI(with: mostFrequentAnswer)
    }
        
        func updateUI(with yogaType: YogaType) {
            yogaLabel.text = "You are a - \(yogaType.rawValue)!"
            yogaDescription.text = yogaType.descriprion
            stylesLabel.text = yogaType.styles
    }
        
    }

