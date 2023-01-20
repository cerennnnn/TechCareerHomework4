//
//  ViewController.swift
//  Homework5
//
//  Created by Ceren Güneş on 17.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    var firstNumber = ""
    var secondNumber = ""
    var operation: [String] = []
    var isFinishedTyping = true
    var result: Double = 0
    var finalResult: Double?
    var pressedNumberOne: String = ""
    var pressedNumberTwo: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        if let pressedNumber = sender.titleLabel?.text {
            getNumbers(pressedNumber: pressedNumber)
        }
    }
    
    @IBAction func ACButtonPressed(_ sender: Any) {
        firstNumber = ""
        secondNumber = ""
        operation = [String]()
        isFinishedTyping = true
        result = 0
        resultsLabel.text = "0"
        print("AC tiklandi: firstNumber: \(firstNumber) secondNumber: \(secondNumber) operation: \(operation)")
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        if let operationButton = sender.titleLabel?.text {
            resultsLabel.text = "0"
            operation.append(operationButton)
            isFinishedTyping = false
            
            print("Operation: \(operation)")
            
            for i in operation {
                if i == "+/-" {
                    
                } else if i == "%" {
                    
                } else if  i == "=" {
                    operation.removeLast()
                    
                    if let n1 = Double(firstNumber), let n2 = Double(secondNumber) {
                        finalResult = calculate(firstNumber: n1, secondNumber: n2, operation: operation[operation.count - 1])

                        if finalResult != nil {
                            resultsLabel.text = String(finalResult!)
                        }
                    }
                }
            }
        }
        
    }
    
    func calculate(firstNumber: Double, secondNumber: Double, operation: String) -> Double {
        
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "÷":
            result = firstNumber / secondNumber
        case "x":
            result = firstNumber * secondNumber
        default:
            result = 0
        }
        
        return result
    }
    
    func getNumbers(pressedNumber: String) {
            if isFinishedTyping {
                getNumberLabel(pressedNumber)
                firstNumber = resultsLabel.text!
            } else {
                getNumberLabel(pressedNumber)
                secondNumber = resultsLabel.text!
            }
    }
    
    func getNumberLabel(_ pressedNumber: String) {
        if resultsLabel.text == "0" {
            resultsLabel.text = pressedNumber
        } else {
            if resultsLabel.text != nil {
                resultsLabel.text! += pressedNumber
            }
        }
    }
}


