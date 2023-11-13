//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var quizBrain = QuizBrain()
    
    var backgroundImage = UIImageView()
    let imageBackground = UIImage(named: "Background-Bubbles")
    
    let image2 = UIImage(named: "Rectangle")
    
    
    let colorBackground = UIColor(named: "ColorBackground")
    
    let labelScore: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    let labelQ: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    let progresBar: UIProgressView = {
        let bar = UIProgressView()
        bar.setProgress(0.2, animated: true)
        bar.trackTintColor = .clear
        bar.tintColor = UIColor(named: "colorRect")
        bar.backgroundColor = .clear
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    let buttonTrue: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("True", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        return button
    }()
    
    let buttonFalse: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("False", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundImage(for: .normal)
        
        return button
    }()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        backgroundImage = UIImageView(image: imageBackground)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(backgroundImage)
        view.addSubview(labelScore)
        view.addSubview(labelQ)
        view.addSubview(progresBar)
        view.addSubview(buttonTrue)
        view.addSubview(buttonFalse)
        
        
        setView()
        setupImageBackground()
        setupLabelScore()
        setupLabelQuestion()
        setupBar()
        setupTrueButton()
        setupFalseButton()
        
    }
    
    func setupBar() {
        progresBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        progresBar.heightAnchor.constraint(equalToConstant: 20).isActive = true
        progresBar.widthAnchor.constraint(equalToConstant: view.self.frame.width).isActive = true
    }
    
    func setupLabelQuestion() {
        labelQ.topAnchor.constraint(equalTo: labelScore.bottomAnchor).isActive = true
        labelQ.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelQ.widthAnchor.constraint(equalToConstant: view.self.frame.width - 30).isActive = true
        labelQ.heightAnchor.constraint(equalToConstant: view.self.frame.height / 2).isActive = true
    }
    
    func setupLabelScore() {
        labelScore.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        labelScore.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelScore.widthAnchor.constraint(equalToConstant: view.self.frame.width - 30).isActive = true
        labelScore.heightAnchor.constraint(equalToConstant: 20).isActive = true
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
        buttonTrue.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
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
        buttonFalse.addTarget(self, action: #selector(buttonsTapped), for: .touchUpInside)
   
    }
    
    @objc private func buttonsTapped(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        if quizBrain.checkAnswer(userAnswer)
        {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
//        updateUI()
        
    }
    
    @objc func updateUI() {
        labelQ.text = quizBrain.getQuestionText()
        progresBar.progress = quizBrain.getProgress()
        labelScore.text = "Score: \(quizBrain.getScore())"
        buttonTrue.backgroundColor = UIColor.clear
        buttonFalse.backgroundColor = UIColor.clear
    
    }
}

extension ViewController {
    private func setView() {
        view.backgroundColor = colorBackground
        
    }
}
