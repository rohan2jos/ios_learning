//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    let noteNames: [String] = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func playSound(_ tagNo: Int){
        var noteIndex = tagNo - 1
        // fetch the exact sound file
        let soundUrl = Bundle.main.url(forResource: noteNames[noteIndex], withExtension: "wav")
        
        // use error handling
        do{
            // open the cd player and pop the cd in the player
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl!)
        }catch{
            print(error)
        }
        audioPlayer.play()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        playSound(sender.tag)
    }
    
  

}

