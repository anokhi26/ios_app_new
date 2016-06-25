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
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request(.GET, "http://feeds.cardsynergy.com/datafeed/?aid=a90e106e&v=4").response { (req, res, data, error) -> Void in
            print(res)
            let outputString = NSString(data: data!, encoding:NSUTF8StringEncoding)
            print(outputString)
        }
        
    //        for name in printName as [AnyObject]{
      //          var
        
        }
      
    
    
       
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)as! CustomCell
        
   //    cell.photo.image = images [indexPath.row]
   //    cell.name.text = names[indexPath.row]
        
       return cell
    }
    
    
    
}
