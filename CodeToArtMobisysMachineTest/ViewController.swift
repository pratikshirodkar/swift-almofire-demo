//
//  ViewController.swift
//  CodeToArtMobisysMachineTest
//
//  Created by harshad kekane on 30/08/17.
//  Copyright © 2017 harshad kekane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var text: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("vasim",text ?? "hello")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

