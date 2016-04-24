//
//  ViewController.swift
//  JustShipIt
//
//  Created by Brian Yan on 4/22/16.
//  Copyright © 2016 Brian Yan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var itemName: UITextField!
    
    @IBOutlet var width: UITextField!

    @IBOutlet var length: UITextField!
    
    @IBOutlet var height: UITextField!
    
    @IBOutlet var weight: UITextField!
    
    @IBOutlet var shippingDestination: UITextField!
    
    @IBOutlet var originDestination: UITextField!
    
    @IBOutlet var item: UITextField!
    
    @IBOutlet var serviceLevelArrayLabel: UILabel!
    
    @IBOutlet var priceArrayLabel: UILabel!
    
    @IBOutlet var dateArrayLabel: UILabel!
    
    @IBOutlet var shipItButton: UIButton!
    
    @IBOutlet var errorLabel: UILabel!
    
    @IBOutlet var backButton: UIButton!
    
    @IBOutlet var mapButton: UIButton!
    
    
    var serviceLevelArray:[String] = [];
    var priceArray:[String] = [];
    var carrierArray:[String] = [];
    var dateArray:[String] = [];
    
    @IBAction func justShipIt(sender: AnyObject) {
        
        if (width.text == "" || length.text == "" || height.text == "" || weight.text == ""
        || shippingDestination.text == "" || originDestination.text == "" || item.text == "")
        {
            self.errorLabel.hidden = false
        }
        
        else {
        let widthValue = width.text
        let lengthValue = length.text
        let heightValue = height.text
        let weightValue = weight.text
        let shippingDestinationValue = shippingDestination.text
        let itemValue = item.text
        let originDestinationValue = originDestination.text
        let itemDouble = Double(itemValue!)
        
        let parameters = [
            "items": [
                [
                    "length": lengthValue!,
                    "width": widthValue!,
                    "height": heightValue!,
                    "weight": weightValue!,
                    "value": itemDouble!
                ]
            ],
            "origin_address": ["zip": originDestinationValue!],
            "destination_address": ["zip": shippingDestinationValue!]
        ]
        



        Alamofire.request(.POST, "https://sandbox.shiphawk.com/api/v4/rates?api_key=ce664be73291da576420dc85e005ef1d", parameters: parameters, headers: ["Content-Type": "applications/json"], encoding: .JSON).responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    for item in json["rates"].arrayValue {
                        self.serviceLevelArray.append(item["service_level"].stringValue);
                        self.priceArray.append(item["price"].stringValue);
                        self.carrierArray.append(item["carrier"].stringValue);
                        self.dateArray.append(item["est_delivery_date"].stringValue);
                    }
                    print(self.serviceLevelArray)
                    print(self.priceArray)
                    print(self.carrierArray)
                    print(self.dateArray)
                    
                    self.width.hidden = true
                    self.length.hidden = true
                    self.height.hidden = true
                    self.weight.hidden = true
                    self.shippingDestination.hidden = true
                    self.item.hidden = true
                    self.originDestination.hidden = true
                    self.errorLabel.hidden = true
                    self.serviceLevelArrayLabel.hidden = false
                    self.priceArrayLabel.hidden = false
                    self.dateArrayLabel.hidden = false
                    self.shipItButton.hidden = true
                    self.backButton.hidden = false
                    self.mapButton.hidden = false
                    self.serviceLevelArrayLabel.text = self.carrierArray[0] + " " + self.serviceLevelArray[0]
                    self.priceArrayLabel.text = "$" + self.priceArray[0]
                    self.dateArrayLabel.text = "Estimated Arrival: " + self.dateArray[0]
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
}
    
    @IBAction func backAction(sender: AnyObject) {
        self.serviceLevelArrayLabel.hidden = true
        self.priceArrayLabel.hidden = true
        self.dateArrayLabel.hidden = true
        self.errorLabel.hidden = true
        self.width.hidden = false
        self.length.hidden = false
        self.height.hidden = false
        self.weight.hidden = false
        self.shippingDestination.hidden = false
        self.item.hidden = false
        self.originDestination.hidden = false
        self.shipItButton.hidden = false
        self.backButton.hidden = true
        self.mapButton.hidden = true
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize.height = 2200
        self.serviceLevelArrayLabel.hidden = true
        self.priceArrayLabel.hidden = true
        self.dateArrayLabel.hidden = true
        self.errorLabel.hidden = true
        self.backButton.hidden = true
        self.mapButton.hidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

