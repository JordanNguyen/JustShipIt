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
        let widthValue = width.text
        let lengthValue = length.text
        let heightValue = height.text
        let weightValue = weight.text
        let shippingDestinationValue = shippingDestination.text
        let itemValue = item.text
        let itemDouble = Double(itemValue!)
        
        let myURL = NSURL(string: "https://sandbox.shiphawk.com/api/v4/rates?api_key=ce664be73291da576420dc85e005ef1d");
        let request = NSMutableURLRequest(URL:myURL!);
        request.HTTPMethod = "POST";
        let postParameters = ["length", ] as Dictionary<String, String>;
        request.HTTPBody = postParameters.dataUsingEncoding(NSUTF8StringEncoding);
        
        
        
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

