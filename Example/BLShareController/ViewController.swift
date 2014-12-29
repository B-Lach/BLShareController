//
//  ViewController.swift
//  BLShareController
//
//  Created by Benny Lach on 22.12.14.
//  Copyright (c) 2014 Benny Lach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var shareController = BLShareController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.customLightGray()
        
        let button = UIButton(frame: CGRectMake(0, 0, 200, 40))
        button.addTarget(self, action: Selector("showShareController"), forControlEvents: UIControlEvents.TouchUpInside)
        button.setTitleColor(UIColor.customDarkGray(), forState: UIControlState.Normal)
        button.setTitle("share", forState: UIControlState.Normal)
        button.titleLabel?.textAlignment = NSTextAlignment.Center
        button.titleLabel?.textColor = UIColor.customDarkGray()
        button.titleLabel?.numberOfLines = 1
        button.center = self.view.center
        
        self.view.addSubview(button)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showShareController() {
        self.view.addSubview(self.shareController.view)
    }
}

