//
//  DataViewController.swift
//  JustShipIt
//
//  Created by Matthew Cheung on 4/23/16.
//  Copyright © 2016 Brian Yan. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {
    
//    var myCustomViewController: ViewController = ViewController(nibName: nil, bundle: nil)
//    var serviceDataArray = myCustomViewController.serviceLevelArray

    
    @IBOutlet var serviceLevel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    
    var serviceArray:[String] = [];
    var priceDataArray:[String] = [];

    

//    serviceLevel.text = viewController.
    override func viewDidLoad() {
        super.viewDidLoad()
        print(serviceArray)
        print(priceDataArray)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
