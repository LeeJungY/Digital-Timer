//
//  ViewController.swift
//  Digital Timer
//
//  Created by D7703_23 on 2018. 4. 10..
//  Copyright © 2018년 D7703_23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timelbl: UILabel!
    @IBOutlet weak var timeSwitch: UISwitch!
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeSwitch.setOn(false, animated: true)
        
        //myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
     func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss EE"
        timelbl.text = formatter.string(from: date)
        //timelbl.text = String(describing: date)
    }
    
    @IBAction func timeStart(_ sender: Any) {
        if timeSwitch.isOn == true {
            
            //closure 사용
            myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in self.updateTime()
                
            })
        } else {
            myTimer.invalidate()
        }
    }
    
}

