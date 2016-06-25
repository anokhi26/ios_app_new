//
//  ViewController.swift
//  Last
//
//  Created by Anokhi Patel on 21/06/16.
//  Copyright © 2016 Anokhi Patel. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON




class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet var tableView: UITableView!
    

  // var names = ["Bank of America", "Chase", "PNC"]
  // var images = [UIImage(named: "Bank of America"), UIImage(named: "Chase"), UIImage(named: "PNC")]
    
    
  //  var nameArray = [NSDictionary]()
    
    class SpeciesWrapper {
        var species: [StarWarsSpecies]?
        var count: Int?
        var next: String?
        var previous: String?
    }
    enum SpeciesFields: String {
       
        case Name = "name"
        
    }
    class StarWarsSpecies {
        var id: Int?
        var name: String?
        
        required init(json: JSON, id: Int?) {
            self.id = id
            self.name = json[SpeciesFields.Name.rawValue].stringValue
    }
        
        class func endpointForSpecies() -> String {
            return "http://feeds.cardsynergy.com/datafeed/?aid=a90e106e&v=4"
    }
        
        
        
    }
    
    var nameArray = [NSDictionary]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request(.GET, "http://feeds.cardsynergy.com/datafeed/?aid=a90e106e&v=4").response { (req, res, JSON, error) -> Void in
            
            let outputString = NSString(data: JSON!, encoding:NSUTF8StringEncoding)
            print(outputString)
            
            
            let printName = outputString
        
            
            for name in printName as [AnyObject]{
                var nameDictionary = [String: String]()
                nameDictionary ["name"] = name ["name"] as? String
                self.nameArray.append(nameDictionary)
            }
            
            self.tableView.reloadData()
        }
        
            
    //        for name in printName as [AnyObject]{
      //          var
        
        }
      
    
    
       
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.nameArray.count > 0 {
            return self.nameArray.count
        }
        else {
            return 0
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as! CustomCell
        
   //    cell.photo.image = images [indexPath.row]
   //    cell.name.text = names[indexPath.row]
        
       return cell
    }
    
    
    
}
