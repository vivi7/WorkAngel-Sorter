//
//  ViewController.swift
//  WorkAngel-Sorter
//
//  Created by Vincenzo Favara on 27/08/15.
//  Copyright (c) 2015 Vincenzo Favara (VinSoft). All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    
    var overlayView : UIView!
    var actInd : UIActivityIndicatorView!
    var actLabel : UILabel!
    
    var travels : [Travel] = []
    var travelModel : TravelModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        travelModel = TravelModel()
        travels = travelModel.getTravels()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - DATASOURCE:
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let travel : Travel = travels[indexPath.row]
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell")!
        
        
        cell.textLabel!.text = travel.cityFrom + " > " + travel.cityTo
        cell.detailTextLabel?.text = travel.typeTrasport + " " + travel.place
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travels.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Unsorted Boarding Cards:"
    }
    

    // MARK: - ACTIONS:
    
    @IBAction func sortTripAction(sender: AnyObject) {
        //travels = sortTravels(travels)
        //self.tableView.reloadData()
        showLoading("Sorting...")
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(0.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
            let vc : ListSortedViewController = self.storyboard?.instantiateViewControllerWithIdentifier("listSortedViewController") as! ListSortedViewController;
            vc.travels = self.travelModel.sortTravels(self.travels)
            self.hideLoading()
            self.showViewController(vc, sender: "")
        }
        
    }
    
    func showLoading(message:String){
        self.overlayView = UIView(frame: self.view.frame)
        self.overlayView.backgroundColor = UIColor(red:0, green:0, blue:0, alpha:0.5);
        view.addSubview(overlayView)
        actInd = UIActivityIndicatorView(frame: CGRectMake(0,0, 100, 100)) as UIActivityIndicatorView
        actInd.center = self.view.center
        actInd.hidesWhenStopped = true
        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(actInd)
        actInd.startAnimating()
        actLabel = UILabel(frame: CGRectMake(0,0,200,200))
        actLabel.textAlignment = .Center
        actLabel.center = self.view.center
        actLabel.frame.origin.y += 50
        actLabel.text = message
        view.addSubview(actLabel)
    }
    
    func hideLoading(){
        actInd.stopAnimating()
        actInd.removeFromSuperview()
        actLabel.removeFromSuperview()
        overlayView.removeFromSuperview()
    }
    

}

