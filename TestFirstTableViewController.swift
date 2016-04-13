//
//  TestFirstTableViewController.swift
//  FBTestApp2
//
//  Created by Muaviya on 29.03.16.
//  Copyright © 2016 Muaviya. All rights reserved.
//

import UIKit
import Firebase

class TestFirstTableViewController: UITableViewController {
        
    var arrayLocations = [String]()
    var arrayRayon = [String]()
    var arrayMaterial = [String]()
    var arrayNum = [Int]()
    var arrayOwner = [String]()
    var arrayPhone = [Int]()
    var arrayLat = [Float]()
    var arrayLng = [Float]()
    
    var rayonNameString :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parsRayon()
        
        navigationItem.title = rayonNameString
    }
    
    func parsRayon() {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let ref = Firebase(url: "https://karerapp.firebaseio.com/Locations/\(rayonNameString!)")
        
        print(ref)
        
        ref.queryOrderedByKey().observeEventType(.Value, withBlock: { snapshot in
            
            //print(snapshot.value)
            
            for childSnap in  snapshot.children.allObjects as! [FDataSnapshot]{
                
                let otherDeviceLocation = childSnap.value!["location"] as! NSString
                let material = childSnap.value!["material"] as! NSString
                let owner = childSnap.value!["owner"] as! NSString
                let rayon = childSnap.value!["rayon"] as! NSString
                let phone = childSnap.value!["phone"] as! Int
                let num = childSnap.value!["num"] as! Int
                let lat = childSnap.value!["lat"] as! Float?
                let lng = childSnap.value!["lng"] as! Float?
               
                /*
                if childSnap.value!["lat"] as! Float? != nil {
                   let lat = childSnap.value!["lat"] as! Float?
                    self.arrayLat.append(lat! as Float)
                    print("lat  = nill")
                }
                if childSnap.value!["lng"] as! Float? != nil{
                    
                    let lng = childSnap.value!["lng"] as! Float?
                    self.arrayLng.append(lng! as Float)
                    print("lng  = nill")
                }
                */
                
                self.arrayLocations.append(otherDeviceLocation as String)
                self.arrayRayon.append(rayon as String)
                self.arrayMaterial.append(material as String)
                self.arrayNum.append(num as Int)
                self.arrayOwner.append(owner as String)
                self.arrayPhone.append(phone as Int)
                self.arrayLat.append(lat! as Float)
                self.arrayLng.append(lng! as Float)
                
                //print(self.arrayLat)
                
            }
            
            self.tableView.reloadData()
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayRayon.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("testCell", forIndexPath: indexPath) as! MyTableViewCell

        cell.ownerLabel.text = arrayOwner[indexPath.row]
        cell.materialLabel.text = arrayMaterial[indexPath.row]
        cell.numLabel.text = String(arrayNum[indexPath.row])
        cell.rayonLabel.text = arrayRayon[indexPath.row]

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "mainSeque" {
            let secondVC = segue.destinationViewController as! SecondViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            secondVC.locationString = arrayLocations[indexPath.row]
            secondVC.materialString = arrayMaterial[indexPath.row]
            secondVC.rayonString = arrayRayon[indexPath.row]
            secondVC.phoneString = String(arrayPhone[indexPath.row])
            secondVC.ownerString = arrayOwner[indexPath.row]
            secondVC.latString = String(arrayLat[indexPath.row])
            secondVC.lngString = String(arrayLng[indexPath.row])
        }
    }
}



/*
 func parseSomeFB() {
 
 UIApplication.sharedApplication().networkActivityIndicatorVisible = true
 
 let ref = Firebase(url: "https://karerapp.firebaseio.com/Locations")
 ref.queryOrderedByKey().observeEventType(.ChildAdded, withBlock: { snapshot in
 
 //print(snapshot.value)
 
 for childSnap in  snapshot.children.allObjects as! [FDataSnapshot]{
 
 let otherDeviceLocation = childSnap.value!["location"] as! NSString
 let material = childSnap.value!["material"] as! NSString
 let owner = childSnap.value!["owner"] as! NSString
 let rayon = childSnap.value!["rayon"] as! NSString
 let phone = childSnap.value!["phone"] as! Int
 let num = childSnap.value!["num"] as! Int
 
 self.arrayLocations.append(otherDeviceLocation as String)
 self.arrayRayon.append(rayon as String)
 self.arrayMaterial.append(material as String)
 self.arrayNum.append(num as Int)
 self.arrayOwner.append(owner as String)
 self.arrayPhone.append(phone as Int)
 
 }
 
 self.tableView.reloadData()
 
 UIApplication.sharedApplication().networkActivityIndicatorVisible = false
 })
 
 }
 */

