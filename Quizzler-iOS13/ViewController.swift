//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var questionLabel: UILabel!
    private var progressBar: UIProgressView!
    
    var backgroundImage = UIImageView()
    let imageBackground = UIImage(named: "Background-Bubbles")
    
    let image2 = UIImage(named: "Rectangle")
    
    let colorBackground = UIColor(named: "ColorBackground")
    
    let labelQ: UILabel = {
        let label = UILabel()
        label.text = "Question Text"
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let buttonTrue: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("True", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        return button
    }()
    
    let buttonFalse: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("False", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundImage(for: .normal)
        
        return button
    }()
    
    var questionNumber = 0
    let quiz = [Question(q: "A slug's blood is green.", a: "True"),
                Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                Question(q: "Google was originally called 'Backrub'.", a: "True"),
                Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        backgroundImage = UIImageView(image: imageBackground)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundImage)
        view.addSubview(labelQ)
        view.addSubview(buttonTrue)
        view.addSubview(buttonFalse)
        
        
        setView()
        setupImageBackground()
        setupLabel()
        setupTrueButton()
        setupFalseButton()
        
    }
    func updateUI() {
        labelQ.text = quiz[questionNumber].text
    }
    
    func setupLabel() {
        labelQ.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        labelQ.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelQ.widthAnchor.constraint(equalToConstant: view.self.frame.width - 30).isActive = true
        labelQ.heightAnchor.constraint(equalToConstant: view.self.frame.height / 2).isActive = true
    }
    
    func setupImageBackground() {
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundImage.widthAnchor.constraint(equalToConstant: view.self.frame.width).isActive = true
        backgroundImage.contentMode = .scaleToFill
    }
    
    func setupTrueButton() {
        buttonTrue.bottomAnchor.constraint(equalTo: buttonFalse.topAnchor, constant: -20).isActive = true
        buttonTrue.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonTrue.heightAnchor.constraint(equalToConstant: 80).isActive = true
        buttonTrue.widthAnchor.constraint(equalToConstant: view.self.frame.width - 30).isActive = true
        buttonTrue.layer.cornerRadius = 20
        buttonTrue.setBackgroundImage(image2, for: .normal)
        buttonTrue.tintColor = .white
        buttonTrue.backgroundColor = colorBackground
    }
    func setupFalseButton() {
        buttonFalse.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40).isActive = true
        buttonFalse.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonFalse.heightAnchor.constraint(equalToConstant: 80).isActive = true
        buttonFalse.widthAnchor.constraint(equalToConstant: view.self.frame.width - 30).isActive = true
        buttonFalse.layer.cornerRadius = 20
        buttonFalse.setBackgroundImage(image2, for: .normal)
        buttonFalse.tintColor = .white
        buttonFalse.backgroundColor = colorBackground
   
    }
    
    @objc private func buttonsTapped(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualQuestion = quiz[questionNumber]
        let actualAnswer = actualQuestion.answer
        
        if userAnswer == actualAnswer
        { 
            print("Right!")
        } else {
            print("Wrong!")
        }
        
        questionNumber += 1
        updateUI()
        
    }
}

extension ViewController {
    private func setView() {
        view.backgroundColor = colorBackground
        
    }
}
