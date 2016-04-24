//
//  CameraViewController.swift
//  JustShipIt
//
//  Created by Brian Yan on 4/24/16.
//  Copyright © 2016 Brian Yan. All rights reserved.
//
import UIKit
import MobileCoreServices

func getDocumentsURL() -> NSURL {
    let documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
    return documentsURL
}

func fileInDocumentsDirectory(filename: String) -> String {
    
    let fileURL = getDocumentsURL().URLByAppendingPathComponent(filename)
    return fileURL.path!
    
}

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet var textview: UITextField!

    @IBOutlet var Camera: UIButton!
    @IBOutlet var Library: UIButton!
    @IBOutlet var ImageDisplay: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textview.hidden = true

        // Do any additional setup after loading the view.
    }
    @IBAction func CameraAction(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .Camera
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func PhotoLibraryAction(sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        picker.allowsEditing = false
        presentViewController(picker, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
        //newMedia = false
    }
    
    func saveImage (image: UIImage, path: String ) -> Bool{
        let jpgImageData = UIImageJPEGRepresentation(image, 1.0)   // if you want to save as JPEG
        let result = jpgImageData!.writeToFile(path, atomically: true)
        return result
        
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        ImageDisplay.image = info[UIImagePickerControllerOriginalImage] as? UIImage;
        dismissViewControllerAnimated(true, completion: nil)
        UIImageWriteToSavedPhotosAlbum(ImageDisplay.image!, nil, nil, nil);
        let myImageName = "image.png"
        let imagePath = fileInDocumentsDirectory(myImageName)
        
        if let image = ImageDisplay.image {
            saveImage(image, path: imagePath)
        } else { print("some error message") }
        
        if let loadedImage = loadImageFromPath(imagePath) {
            print(" Loaded Image: \(loadedImage)")
        } else { print("some error message 2") }
        
//            
//            ImageDisplay.image = image
//            textview.text = "Recognizing..."
//            //button.enabled = false
//            if let image = UIImage(named: "example.png") {
//                if let data = UIImageJPEGRepresentation(image, 0.8) {
//                    let filename = getDocumentsDirectory().stringByAppendingPathComponent("copy.png")
//                    print(filename)
//                    data.writeToFile(filename, atomically: true)
//                }
//            }
//        
//        dismissViewControllerAnimated(true, completion: nil)
        }
    func loadImageFromPath(path: String) -> UIImage? {
        
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            
            print("missing image at: \(path)")
        }
        print("Loading image from path: \(path)") // this is just for you to see the path in case you want to go to the directory, using Finder.
        return image
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    private func recognizeImage(image: UIImage!) {
        // Scale down the image. This step is optional. However, sending large images over the
        // network is slow and does not significantly improve recognition performance.
        

        // Send the JPEG to Clarifai for standard image tagging.
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
