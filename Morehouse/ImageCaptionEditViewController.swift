//
//  ImageCaptionEditViewController.swift
//  Morehouse
//
//  Created by Gloria Kimbwala on 3/19/16.
//  Copyright © 2016 gkimbwala. All rights reserved.
//

import UIKit

class ImageCaptionEditViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    
    var image : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.ImageView.image = self.image
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "didTapDone")
    }

    func didTapDone() {
    self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
