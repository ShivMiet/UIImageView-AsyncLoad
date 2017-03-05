//
//  ImageViewController.swift
//  DownloadImagesSample
//
//  Created by Vinodh Govind Swamy on 3/5/17.
//  Copyright © 2017 Vinodh Swamy. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    var photo : Photo?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.progressView.setProgress(0.0, animated: false)
        if let inPhoto = photo {
            imageView.setImageFrom(imageURLString: inPhoto.originalURl, placeHolderImage: nil, progressHandler: { (totalEXpetedBytes, downloadedBytes, error) in
                
                let progress = Float(downloadedBytes) / Float(totalEXpetedBytes)
                
                self.progressView.setProgress(progress, animated: true)
                
            }, completionHandler:{(success, image, error) in
                self.progressView.isHidden = true
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dissmissScreen(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func swipeToDissmiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
