//
//  ViewController.swift
//  EightBall
//
//  Created by Roeut Chak on 9/30/15.
//  Copyright © 2015 Roeut Chak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var answerView: UITextView!
    
    let answers = ["\rYES", "\rNO", "\rMAYBE",
                    "I\rDON'T\rKNOW", "TRY\rAGAIN\rSOON", "READ\rTHE\rMANUAL" ]
    
    func fadeFortune(){
        UIView.animateWithDuration(0.75){
            self.answerView.alpha = 0.0
        }
    }
    
    func newFortune() {
        let randomIndex = Int(arc4random_uniform(UInt32(answers.count)))
        answerView.text = answers[randomIndex];
        UIView.animateWithDuration(2.0){
            self.answerView.alpha = 1.0
        }
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            fadeFortune()
        }
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            newFortune()
        }
    }
    
    override func motionCancelled(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            newFortune()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

