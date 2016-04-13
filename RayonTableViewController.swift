//
//  RayonTableViewController.swift
//  FBTestApp2
//
//  Created by Muaviya on 03.04.16.
//  Copyright © 2016 Muaviya. All rights reserved.
//

import UIKit
import Firebase

class RayonTableViewController: UITableViewController {

    var arrayRayon = [String]()
    var arrayRayonInMainRayon = [String]()
    private var token: dispatch_once_t = 0
    
    @IBOutlet var myActivityIndecatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let backgroundImage = UIImageView(image: UIImage(named: "karerWallpaer"))
//
//        backgroundImage.contentMode = .ScaleAspectFill
//        
//        tableView.backgroundView = backgroundImage
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        UIApplication.sharedApplication().statusBarStyle = .Default
        
        self.myActivityIndecatorView.startAnimating()
        
        parseRayonFB()
        parseRayonFBSecond()
        
    }
    
    func parseRayonFB() {
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let ref = Firebase(url: "https://karerapp.firebaseio.com/Locations")
        ref.queryOrderedByKey().observeEventType(.Value, withBlock: { snapshot in
            
            
            for chld in snapshot.value as! NSDictionary{
                
                //print(chld.value)
                
                self.arrayRayon.append(chld.key as! String)
            }
            
            self.tableView.reloadData()
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        })
        
    }
    
    func parseRayonFBSecond() {
        
        dispatch_once(&token){
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            let ref = Firebase(url: "https://karerapp.firebaseio.com/Locations/Акушинский%20район")
            ref.queryOrderedByKey().observeEventType(.Value, withBlock: { snapshot in
                
                //print(snapshot.value)
                
                for childSnap in  snapshot.children.allObjects as! [FDataSnapshot]{
                    
                    
                    let rayon = childSnap.value!["rayon"] as! NSString
                    
                    self.arrayRayonInMainRayon.append(rayon as String)
                    
                   // print(self.arrayRayonInMainRayon)
                }
                
                self.tableView.reloadData()
                
                UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                
                self.myActivityIndecatorView.stopAnimating()
                
                self.myActivityIndecatorView.hidesWhenStopped = true
                
            })

        }
    }



    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayRayon.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("rayonCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.arrayRayon[indexPath.row]
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "mainSeque2" {
            let secondVC = segue.destinationViewController as! TestFirstTableViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            //print(self.arrayRayon[indexPath.row])
            
            secondVC.rayonNameString = self.arrayRayon[indexPath.row]
        }
    }
}


/*
 private var token: dispatch_once_t = 0
 
 dispatch_once(&token){
 self.mapView.setCenterCoordinate(locations.last!.coordinate, atZoomLevel: 17, animated: true)
 }

 
 func parseRayonFB() {
 
 UIApplication.sharedApplication().networkActivityIndicatorVisible = true
 
 let ref = Firebase(url: "https://karerapp.firebaseio.com/Locations")
 ref.queryOrderedByKey().observeEventType(.ChildAdded, withBlock: { snapshot in
 
 //print(snapshot.value)
 
 for childSnap in  snapshot.children.allObjects as! [FDataSnapshot]{
 
 let rayon = childSnap.value!["rayon"] as! NSString
 
 self.arrayRayon.append(rayon as String)
 
 }
 
 self.tableView.reloadData()
 
 UIApplication.sharedApplication().networkActivityIndicatorVisible = false
 })
 
 }
 
 func parseRayonFB() {
 
 UIApplication.sharedApplication().networkActivityIndicatorVisible = true
 
 let ref = Firebase(url: "https://karerapp.firebaseio.com/Locations")
 
 ref.observeSingleEventOfType(.Value, withBlock: { snapshot in
 print(snapshot.childrenCount) // I got the expected number of items
 for rest in snapshot.children.allObjects as! [FDataSnapshot] {
 print(rest.value)
 }
 })
 }

 
 */
