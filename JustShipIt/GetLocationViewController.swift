//
//  GetLocationViewController.swift
//  JustShipIt
//
//  Created by Brian Yan on 4/23/16.
//  Copyright © 2016 Brian Yan. All rights reserved.
//
import MapKit
import UIKit
import CoreLocation

class GetLocationViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    @IBOutlet var mapview: MKMapView!
    var zipcode:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapview.showsUserLocation = true
        print(self.zipcode)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        // store zipcode
        self.getLocationAddress(location!)
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        self.mapview.setRegion(region, animated: true)
        
        self.locationManager.stopUpdatingLocation()
    }
    func getLocationAddress(location:CLLocation) {
        let geocoder = CLGeocoder()
        print("-> Finding user address...")
        geocoder.reverseGeocodeLocation(location, completionHandler:  {(placemarks, error) in
            if (error != nil) {
                print("reverse geodcode fail: \(error!.localizedDescription)")}
            var placemark:CLPlacemark!
            if error == nil && placemarks!.count > 0 {
                placemark = placemarks![0] as CLPlacemark
                if placemark.postalCode != nil {
                    self.zipcode = placemark.postalCode!
                    print(self.zipcode)
                }
            }
        })
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Errors: " + error.localizedDescription)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
