//
//  ViewController.swift
//  Calculate
//
//  Created by Roman Ziabkin on 09.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var operand = " "
    var numberOne = " "
    var numberTwo = " "
    
    @IBOutlet weak var resultLabel: UILabel!
    
    /* Функция нажатия кнопок 0...9
     При нажатии на цифры, значения будут передаваться в переменную numberOne и отображаться в элементе resultLabel. Далее если будет нажата кнопка с операндом то значения будут записываться в переменную operand, и пользователь может ввести второе число, которое в свою очередь будет записываться в переменную numberTwo.
     */
    @IBAction func inputNumber(_ sender: UIButton) {
        
        if operand.isEmpty {
            numberOne = numberOne + (sender.titleLabel?.text)!
            resultLabel.text = numberOne
        } else {
            numberTwo = numberTwo + (sender.titleLabel?.text)!
            resultLabel.text = numberTwo
        }
        
    }
    
    //Функция обнуления
    @IBAction func clearAction(_ sender: UIButton) {
        numberOne = " "
        numberTwo = " "
        operand = " "
        resultLabel.text = "0"
    }
    
    // Функция обработки нажатия на клавиши +, -, /, *
    @IBAction func inputOperand(_ sender: UIButton) {
        operand = (sender.titleLabel?.text! ?? <#default value#>)!
    }
    
    //Кнопка результата
    @IBAction func resultAction(_ sender: Any) {
        var result = 0.0
        
        switch operand {
        case "/":
            result = Double(numberOne)! / Double(numberTwo)!
        case "*":
            result = Double(numberOne)! * Double(numberTwo)!
        case "-":
            result = Double(numberOne)! - Double(numberTwo)!
        case "+":
            result = Double(numberOne)! + Double(numberTwo)!
        default:
            break
        }
        
        if result.truncatingRemainder(dividingBy: 1.0) == 00 {
            resultLabel.text = String(Int(result))
        } else {
            resultLabel.text = String(result)
        }
    }
    
}
