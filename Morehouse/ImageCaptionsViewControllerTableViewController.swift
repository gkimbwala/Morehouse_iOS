//
//  ImageCaptionsViewControllerTableViewController.swift
//  Morehouse
//
//  Created by Gloria Kimbwala on 3/19/16.
//  Copyright © 2016 gkimbwala. All rights reserved.
//

import UIKit

class ImageCaptionsViewControllerTableViewController: UITableViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imageCaptions = [ImageCaption]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Image Captions"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Add, target: self, action: "addButtonWasTapped")// anytime button item is tappeed rightBarButton is tapped it calls addButtonWasTapped()
    }
    
    func addButtonWasTapped(){
        //UIImagePickerController
       let imagePickerController = UIImagePickerController.init()
        imagePickerController.delegate = self
        self.presentViewController(imagePickerController, animated: true, completion:nil)
    }
    
    internal func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        let imageCaptionEditViewController = ImageCaptionEditViewController()
        imageCaptionEditViewController.image = image
        
        let navController = UINavigationController(rootViewController: imageCaptionEditViewController)
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        self.presentViewController(navController, animated: true) { () -> Void in
            let imageCaption = ImageCaption()
            imageCaption.image = image
            self.imageCaptions.append(imageCaption)
            self.tableView.reloadData()
        }
        
    }
   
    internal func imagePickerControllerDidCancel(picker: UIImagePickerController){
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imageCaptions.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier")
        
        if (cell == nil) {
        cell = UITableViewCell(style: .Default, reuseIdentifier: "reuseIdentifier")
        }

        cell?.imageView?.image = self.imageCaptions[indexPath.row].image

        return cell!
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
