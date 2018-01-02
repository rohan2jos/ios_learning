//
//  ViewController.swift
//  Simple Calculator
//
//  Created by Rohan Joshi on 12/29/17.
//  Copyright © 2017 Rohan Joshi. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    let DEFAULTNO: Double = 0.0000
    let DEFAULTNOSCREEN: Double = 0.0000
    var numbersOnScreen: Double = 0
    var numberOne: Double = 0.0000
    var prevNumberAddSub: Double = 0
    var numberOneMulDiv: Double = 1
    var currentOperation: String = ""
    var prevNumber: Double = 0
    var opCounter: Int = 0
    var isDecimal: Bool = false
    var decimalCounter: Int = 0
    @IBOutlet weak var numberScreen: UILabel!
    
    func clearAll(){
        
        /*
         reset the values of all the variables, answers, operations
         */
        
        self.currentOperation = ""
        self.numbersOnScreen = DEFAULTNOSCREEN
        self.prevNumber = DEFAULTNO
        self.numberOne = DEFAULTNO
        self.opCounter = 0
        self.isDecimal = false
        self.decimalCounter = 0
        updateLabel(self.numbersOnScreen)
    }
    
    func doAdd(_ noOp: Bool){
        self.currentOperation = "add"
        
        /*
         Case 1: Case when the = is pressed without a second number
         Case 2: Case when the + sign is pressed to enter another number
         Case 3: Case when the = sign is pressed
         */
        
        if(noOp == true){
            if(self.opCounter == 0){
                self.prevNumber = 0 + self.numberOne
            }else{
                self.prevNumber = self.prevNumber + self.numberOne
            }
        }else{
            self.prevNumber = self.prevNumber + self.numbersOnScreen
            self.numberOne = self.numbersOnScreen
        }
        updateLabel(self.prevNumber)
        self.numbersOnScreen = DEFAULTNOSCREEN
    }
    
    func doSub(_ noOp: Bool){
        self.currentOperation = ("sub")
        
        if(noOp == true){
            if(self.opCounter == 0){
                self.prevNumber = self.numberOne - 0
            }else{
                self.prevNumber = self.prevNumber - self.numberOne
            }
        }else{
            if(self.prevNumber == DEFAULTNO){
                self.prevNumber = self.numbersOnScreen - 0
            }else if(self.numbersOnScreen == DEFAULTNOSCREEN){
                self.prevNumber = self.prevNumber - 0
            }else{
                self.prevNumber = self.prevNumber - self.numbersOnScreen
            }
            print("\(self.prevNumber) - \(self.numbersOnScreen)")
            self.numberOne = self.numbersOnScreen
        }
        updateLabel(self.prevNumber)
        self.numbersOnScreen = DEFAULTNOSCREEN
    }
    
    func doDiv(_ noOp: Bool){
        self.currentOperation = "div"
        
        /*
         case 1: Case when equal is pressed without a divisor
         case 2: Case when the dividend is default
         case 3: When / sign is pressed to enter another number
         */
        
        if(noOp == true){
            if(self.opCounter == 0){
                self.prevNumber = self.numbersOnScreen / 1
            }else{
                self.prevNumber = self.prevNumber / self.numberOne
            }
        }else{
            if(self.prevNumber == DEFAULTNO){
                self.prevNumber = self.numbersOnScreen / 1
            }else if(self.numbersOnScreen == DEFAULTNOSCREEN){
                self.prevNumber = self.prevNumber / 1
            }else{
                self.prevNumber = self.prevNumber / self.numbersOnScreen
            }
            self.numberOne = self.numbersOnScreen
        }
        updateLabel(self.prevNumber)
        self.numbersOnScreen = DEFAULTNOSCREEN
    }
    
    func doMul(_ noOp: Bool){
        self.currentOperation = "mul"
        if(noOp == true){
            if(self.opCounter == 0){
                self.prevNumber = self.numbersOnScreen * 1
            }else{
                self.prevNumber = self.prevNumber * self.numberOne
            }
        }else{
            if(self.prevNumber == DEFAULTNO){
                self.prevNumber = self.numbersOnScreen * 1
            }else if(self.numbersOnScreen == DEFAULTNOSCREEN){
                self.prevNumber = self.prevNumber * 1
            }else{
                self.prevNumber = self.prevNumber * self.numbersOnScreen
            }
            self.numberOne = self.numbersOnScreen
        }
        updateLabel(self.prevNumber)
        self.numbersOnScreen = DEFAULTNOSCREEN
    }
    
    @IBAction func signButtonPressed(_ sender: UIButton){
        if(sender.tag == 16){
            print("adding")
            self.doAdd(false)
            self.opCounter = self.opCounter + 1
            self.isDecimal = false
            self.decimalCounter = 0
        }else if(sender.tag == 17){
            print("calculating")
            if(self.currentOperation == "add"){
                if(self.numbersOnScreen == DEFAULTNOSCREEN){
                    self.doAdd(true)
                }else{
                    self.doAdd(false)
                }
            }else if(self.currentOperation == "div"){
                if(self.numbersOnScreen == DEFAULTNOSCREEN){
                    self.doDiv(true)
                }else{
                    self.doDiv(false)
                }
            }else if(self.currentOperation == "mul"){
                if(self.numbersOnScreen == DEFAULTNOSCREEN){
                    self.doMul(true)
                }else{
                    self.doMul(false)
                }
            }else if(self.currentOperation == "sub"){
                if(self.numbersOnScreen == DEFAULTNOSCREEN){
                    self.doSub(true)
                }else{
                    self.doSub(false)
                }
            }
            self.isDecimal = false
            self.decimalCounter = 0
        }else if(sender.tag == 11){
            print("clearing")
            self.clearAll()
        }else if(sender.tag == 13){
            print("dividing")
            self.doDiv(false)
            self.opCounter = self.opCounter + 1
            self.isDecimal = false
            self.decimalCounter = 0
        }else if(sender.tag == 14){
            print("multiplying")
            self.doMul(false)
            self.opCounter = self.opCounter + 1
            self.isDecimal = false
            self.decimalCounter = 0
        }else if(sender.tag == 15){
            print("subtracting")
            self.doSub(false)
            self.opCounter = self.opCounter + 1
            self.isDecimal = false
            self.decimalCounter = 0
        }
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        print(sender.tag)
        if(sender.tag == 12){
            print("decimal")
            print("setting isDecimal = true")
            self.isDecimal = true
            print("incrementing the decimalCounter")
            self.decimalCounter = self.decimalCounter + 1
        }else{
            if(self.isDecimal == true){
                print("isDecimal = true, creating a number")
                var i: Int = 0
                var temp: Double = 1
                print("temp = 1")
                while(i < self.decimalCounter){
                    temp = temp * 0.1
                    i = i + 1
                }
                print("\(self.numbersOnScreen) + \(sender.tag) * \(temp)")
                self.numbersOnScreen = self.numbersOnScreen + (Double(sender.tag) * temp)
            }else{
                self.numbersOnScreen = (self.numbersOnScreen * 10) + Double(sender.tag)
            }
        }
        
        updateLabel(numbersOnScreen)
    }
    
    func updateLabel(_ newNumbersOnScreen: Double){
        self.numberScreen.text = "\(newNumbersOnScreen)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        numberScreen.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

