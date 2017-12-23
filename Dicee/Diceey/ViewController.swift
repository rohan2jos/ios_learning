//
//  ViewController.swift
//  Diceey
//
//  Created by Rohan Joshi on 12/21/17.
//  Copyright © 2017 Rohan Joshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // array that contains the names of the images corresponding to the numbers
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    // reference to the first dice image
    @IBOutlet weak var diceImageView1: UIImageView!
    
    // reference to the second dice image
    @IBOutlet weak var diceImageView2: UIImageView!
    
    // generate 2 random numbers between 0 and 6 (6 not included)
    // calls updateDiceImages with 2 generated random numbers: random1 and random2
    func generateRandomNos(){
        var random1: Int = 0
        var random2: Int = 0
        
        random1 = Int(arc4random_uniform(6))
        random2 = Int(arc4random_uniform(6))
        
        updateDiceImages(random1, random2)
    }
    
    // generate random numbers on load and change the images on the dice face to match
    // the generated random numbers when the app is first opened
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomNos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // load the image on the image views based on the random numbers that were generated
    // we will load the random number as the index and then take the image that is
    // pointed to by the random number in the array of image names
    func updateDiceImages(_ randomDiceIndex1: Int, _ randomDiceIndex2: Int){
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
    }
    
    // generates random numbers when the "Roll" button is pressed and changes the images
    // on the dice face to match the random numbers that are generated
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        generateRandomNos()
    }
    
    // generates random numbers when the Shake gesture has 'ended' and changes the images
    // on the dice face to match the random numbers that are generated 
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        generateRandomNos()
    }
    
}

