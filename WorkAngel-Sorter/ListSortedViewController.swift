//
//  ListSortedViewController.swift
//  WorkAngel-Sorter
//
//  Created by Vincenzo Favara on 28/08/15.
//  Copyright (c) 2015 Vincenzo Favara (VinSoft). All rights reserved.
//

import UIKit

class ListSortedViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var travels : [Travel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - DATASOURCE:
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let travel : Travel = travels[indexPath.row]
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cellSorted")!
        
        cell.textLabel!.text = travel.cityFrom + " > " + travel.cityTo
        cell.detailTextLabel?.text = travel.typeTrasport + " " + travel.place
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travels.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Sorted Trip:"
    }

}
