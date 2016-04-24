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
    @IBOutlet weak var width: UITextField!
    @IBOutlet weak var length: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var shippingDestination: UITextField!
    @IBOutlet weak var item: UITextField!
    
    @IBAction func justShipIt(sender: AnyObject) {
//        let widthValue = width.text
//        let lengthValue = length.text
//        let heightValue = height.text
//        let weightValue = weight.text
//        let shippingDestinationValue = shippingDestination.text
//        let itemValue = item.text
//        let itemDouble = Double(itemValue!)
        
        let parameters = [
            "items": [
                "length": "10",
                "width" : "10",
                "height": "11",
                "weight": "10",
                "value": 300.00
            ],
            "origin_address": [
                "zip": "93101"
            ],
            "destination_address": [
                "zip": "60060"
            ]
        ]

//        let parameters = [
//            "foo": [1,2,3],
//            "bar": [
//                "baz": "qux"
//            ]
//        ]
//        
//        Alamofire.request(.POST, "https://sandbox.shiphawk.com/api/v4/rates?api_key=ce664be73291da576420dc85e005ef1d", parameters: parameters, encoding: .JSON).responseJSON
//            { response in switch response.result {
//            case .Success(let JSON):
//                print("Success with JSON: \(JSON)")
//                
//                let response = JSON as! NSDictionary
//                
//                //example if there is an id
////                let userId = response.objectForKey("id")!
//                
//            case .Failure(let error):
//                print("Request failed with error: \(error)")
//                }
//        }
        
        Alamofire.request(.GET, "https://sandbox.shiphawk.com/api/v4/unpacked_item_types/search?name=chair&api_key=ce664be73291da576420dc85e005ef1d")
//            .response { request, response, data, error in
//                print(request)
//                print(response)
//                print(data!)
////                print(error)
//        }
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
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

