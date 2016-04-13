//
//  SecondViewController.swift
//  FBTestApp2
//
//  Created by Muaviya on 03.04.16.
//  Copyright © 2016 Muaviya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var materialLabel: UILabel!
    @IBOutlet weak var rayonLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var materialString: String?
    var rayonString: String?
    var ownerString: String?
    var phoneString: String?
    var locationString: String?
    var latString: String?
    var lngString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        materialLabel.text = materialString
        rayonLabel.text = rayonString
        ownerLabel.text = ownerString
        phoneLabel.text = phoneString
        locationLabel.text = locationString
        
       // print("lat = \(latString!), and lng = \(lngString!)")
        
        let lat = NSUserDefaults.standardUserDefaults()
        lat.setValue(latString, forKey: "lat")
        
        let lng = NSUserDefaults.standardUserDefaults()
        lng.setValue(lngString, forKey: "lng")
        
    }
    
    

}
