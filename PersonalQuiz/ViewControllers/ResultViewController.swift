//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 15.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var resultIconLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    // MARK: - Public properties
    var answersChosen: [Answer]!
    
    // MARK: - Private properties
    private var resultIcon: String = ""
    private var resultDescription: String = ""
    
    //MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        getResults(for: answersChosen)
        resultIconLabel.text = "Вы - \(resultIcon)!"
        resultDescriptionLabel.text = resultDescription
    }
    
    override func viewDidLayoutSubviews() {
        UIView.animate(withDuration: 0.7) {
            self.resultIconLabel.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.7) {
            self.resultIconLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    // MARK: - IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("ResultViewController is deallocated")
    }
    
    //MARK: - Private methods
    private func getResults(for answers: [Answer]) {
        
        var animals: [Animal] = []
        var mostCommonAnimal: [Animal] = []
        
        for answer in answers {
            animals.append(answer.animal)
        }
        
        for result in animals {
            let cutAnimal = animals.removeFirst()
            if animals.contains(result) && !mostCommonAnimal.contains(result) {
                mostCommonAnimal.append(cutAnimal)
            }
        }
        print(mostCommonAnimal)
            resultIcon = String(mostCommonAnimal.first?.rawValue ?? "🦖")
            resultDescription = mostCommonAnimal.first?.definition ?? "Вы удивительны! Но попробуйте пройти тест еще раз."
        }
    }
