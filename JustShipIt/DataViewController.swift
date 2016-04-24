//
//  DataViewController.swift
//  JustShipIt
//
//  Created by Matthew Cheung on 4/23/16.
//  Copyright © 2016 Brian Yan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DataViewController: UIViewController {
    
//    var myCustomViewController: ViewController = ViewController(nibName: nil, bundle: nil)
//    var serviceDataArray = myCustomViewController.serviceLevelArray

    @IBOutlet var Option1: UIButton!
    @IBOutlet var Option3: UIButton!
    @IBOutlet var Option4: UIButton!
    @IBOutlet var Option5: UIButton!
    @IBOutlet var Option2: UIButton!
    var products: [String] = []
    var nameItem: String = ""
    
    @IBAction func button1action(sender: AnyObject) {
        nameItem = Option1.titleLabel!.text!
        self.performSegueWithIdentifier("buttonSegue", sender: self)
    }
    
    @IBAction func button2action(sender: AnyObject) {
        nameItem = Option2.titleLabel!.text!
        self.performSegueWithIdentifier("buttonSegue", sender: self)
    }
    
    @IBAction func button3action(sender: AnyObject) {
        nameItem = Option3.titleLabel!.text!
        self.performSegueWithIdentifier("buttonSegue", sender: self)
    }
    
    @IBAction func button4action(sender: AnyObject) {
        nameItem = Option4.titleLabel!.text!
        self.performSegueWithIdentifier("buttonSegue", sender: self)
    }
    
    @IBAction func button5action(sender: AnyObject) {
        nameItem = Option5.titleLabel!.text!
        self.performSegueWithIdentifier("buttonSegue", sender: self)
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue,sender: AnyObject!) {
        var svc = segue.destinationViewController as! ViewController;
        Alamofire.request(.GET, "https://sandbox.shiphawk.com/api/v4/unpacked_item_types/search?name="+nameItem+"&api_key=ce664be73291da576420dc85e005ef1d", encoding: .JSON).responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print(json[0]["avg_length"].stringValue)
                    svc.length.text = json[0]["avg_length"].stringValue
                    svc.weight.text = json[0]["avg_weight"].stringValue
                    svc.height.text = json[0]["avg_height"].stringValue
                    svc.width.text  = json[0]["avg_width"].stringValue
                    svc.itemName.text = self.nameItem
                    
                }
            case .Failure(let error):
                print(error)
            }
        }
        }
    
    
    var serviceArray:[String] = [];
    var priceDataArray:[String] = [];

    

//    serviceLevel.text = viewController.
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.products)
        Option1.setTitle(products[0], forState: .Normal)
        Option2.setTitle(products[1], forState: .Normal)
        Option3.setTitle(products[2], forState: .Normal)
        Option4.setTitle(products[3], forState: .Normal)
        Option5.setTitle(products[4], forState: .Normal)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
