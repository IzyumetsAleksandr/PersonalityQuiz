//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var userAnswers: [Answer] = []
    
    var dogCount = 0
    var catCount = 0
    var rabbitCount = 0
    var turtleCount = 0
    
    let resultDog = Animal.dog
    let resultCat = Animal.cat
    let resultRabbit = Animal.rabbit
    let resultTurtle = Animal.turtle

    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "")
        countingTheNumberOfAnimals()
    }

    func countingTheNumberOfAnimals() {
        for answer in userAnswers {
            switch answer.animal {
            case .cat:
                catCount += 1
            case .dog:
                dogCount += 1
            case .rabbit:
                rabbitCount += 1
            case .turtle:
                turtleCount += 1
            }
        }
        var animals = [Animal: Int]()
        
        animals[.cat] = catCount
        animals[.dog] = dogCount
        animals[.rabbit] = rabbitCount
        animals[.turtle] = turtleCount
        
        guard let maxAnimal = animals.max(by: { $0.value < $1.value })?.key else { return }
        
        print("maxAnimal: \(maxAnimal)")
        
        switch maxAnimal {
        case .dog:
            resultLabel.text = "Вы - \(resultDog.rawValue)"
            resultDescriptionLabel.text = resultDog.definition
        case .cat:
            resultLabel.text = "Вы - \(resultCat.rawValue)"
            resultDescriptionLabel.text = resultCat.definition
        case .rabbit:
            resultLabel.text = "Вы - \(resultRabbit.rawValue)"
            resultDescriptionLabel.text = resultRabbit.definition
        case .turtle:
            resultLabel.text = "Вы - \(resultTurtle.rawValue)"
            resultDescriptionLabel.text = resultTurtle.definition
        }
    }
}
