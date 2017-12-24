//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Rohan Joshi on 12/23/17.
//  Copyright © 2017 Rohan Joshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ballImage: UIImageView!
    
    // array that holds the image names
    let ballImages = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    // generates a random number between 0 and 5 (5 not included)
    func generateRandomImage(){
        var randomImageNo:Int = Int(arc4random_uniform(5))
        setBallImage(randomImageNo)
    }
    
    // receives a random number that has been generated and sets the image
    // to an image pertaining to the index that is the random number
    func setBallImage(_ randomImageNo: Int){
        ballImage.image = UIImage(named: ballImages[randomImageNo])
    }
    
    // generates a random image from the random number generator when the
    // app loads for the first time
    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // populates the image view with a random image on button press
    @IBAction func askButtonPressed(_ sender: UIButton) {
        generateRandomImage()
    }
    
    // populates the image view with a random image on shake gesture
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        generateRandomImage()
    }
    
}

