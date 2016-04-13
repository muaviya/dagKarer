//
//  FirstViewController.swift
//  FBTestApp2
//
//  Created by Muaviya on 05.04.16.
//  Copyright © 2016 Muaviya. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        //navigationController!.navigationBar.barTintColor = UIColor.blackColor()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        navigationController?.navigationBar.alpha = 0
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
