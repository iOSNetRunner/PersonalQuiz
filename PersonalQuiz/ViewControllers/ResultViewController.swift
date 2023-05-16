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
        
        for answer in answers {
            animals.append(answer.animal)
        }
        
        let mostCommonAnimal = Dictionary(grouping: animals, by: {$0}).filter { $1.count > 1}.keys
        
        for result in mostCommonAnimal {
            resultIcon = String(result.rawValue)
            resultDescription = result.definition
        }
        
        if mostCommonAnimal.isEmpty || mostCommonAnimal.count > 1 {
            resultIcon = "🦖"
            resultDescription = "Вы удивительны! Но попробуйте пройти тест еще раз."
        }
    }
}
