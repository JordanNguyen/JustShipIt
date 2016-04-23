//
//  ViewController.swift
//  JustShipIt
//
//  Created by Brian Yan on 4/22/16.
//  Copyright © 2016 Brian Yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var width: UITextField!
    @IBOutlet weak var length: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var shippingDestination: UITextField!

    func isStringEmpty(stringValue:String) -> Bool
    {
        var returnValue = false
        
        // Make sure user did not submit number of empty spaces
        let stringNoSpaces = stringValue.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if(stringNoSpaces.isEmpty == true)
        {
            returnValue = true
            return returnValue
        }
        
        return returnValue
        
    }
    
    @IBAction func justShipIt(sender: AnyObject) {
        let widthValue = width.text
        let lengthValue = length.text
        let heightValue = height.text
        let weightValue = weight.text
        let shippingDestinationValue = shippingDestination.text
        
        // Check is textboxes are empty
        if isStringEmpty(widthValue!) == true
        {
            return
        }
        
        // If not null, then do http request
        
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

