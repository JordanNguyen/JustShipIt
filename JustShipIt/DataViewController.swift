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

    @IBOutlet var Option1: UIButton!
    @IBOutlet var Option3: UIButton!
    @IBOutlet var Option4: UIButton!
    @IBOutlet var Option5: UIButton!
    @IBOutlet var Option2: UIButton!
    var products: [String] = []
    
    
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
