//
//  ViewController.swift
//  JustShipIt
//
//  Created by Brian Yan on 4/22/16.
//  Copyright © 2016 Brian Yan. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    @IBOutlet var width: UITextField!

    @IBOutlet var length: UITextField!
    
    @IBOutlet var height: UITextField!
    
    @IBOutlet var weight: UITextField!
    
    @IBOutlet var shippingDestination: UITextField!
    
    @IBOutlet var item: UITextField!
    @IBAction func justShipIt(sender: AnyObject) {
        let widthValue = width.text
        let lengthValue = length.text
        let heightValue = height.text
        let weightValue = weight.text
        let shippingDestinationValue = shippingDestination.text
        let itemValue = item.text
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
            "origin_address": ["zip": "93101"],
            "destination_address": ["zip": shippingDestinationValue!]
        ]
        
        Alamofire.request(.POST, "https://sandbox.shiphawk.com/api/v4/rates?api_key=ce664be73291da576420dc85e005ef1d", parameters: parameters, headers: ["Content-Type": "applications/json"], encoding: .JSON).responseJSON
            { response in switch response.result {
            case .Success(let JSON):
                print("Success with JSON: \(JSON)")
                
                let response = JSON as! NSDictionary
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

