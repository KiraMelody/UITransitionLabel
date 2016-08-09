//
//  ViewController.swift
//  UITransitionLabel
//
//  Created by KiraMelody on 08/08/2016.
//  Copyright (c) 2016 KiraMelody. All rights reserved.
//

import UIKit
@testable import UITransitionLabel

class ViewController: UIViewController {
    var textLabel = UITransitionLabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        view.addSubview(textLabel)
        textLabel.transitFromToWithDuration(10, endNum: 1000000, duration: 10)
        textLabel.format = "%6d"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

