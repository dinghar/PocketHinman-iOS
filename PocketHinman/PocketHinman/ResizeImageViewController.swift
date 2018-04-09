//
//  ResizeImageViewController.swift
//  PocketHinman
//
//  Created by Ross Harding on 4/9/18.
//  Copyright © 2018 Harding LLC. All rights reserved.
//

import UIKit

class ResizeImageViewController: UIViewController, UIScrollViewDelegate {
    
    var image: UIImage?
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 5
        scrollView.zoomScale = 1
        imageView.image = image
        imageView.frame = scrollView.bounds
        scrollView.contentSize = imageView.bounds.size
        
        if image != nil {
            let zoomScale: CGFloat = min(self.view.bounds.size.width / imageView.image!.size.width, self.view.bounds.size.height / imageView.image!.size.height);
            
            if (zoomScale > 1) {
                self.scrollView.minimumZoomScale = 1;
            }
            
            self.scrollView.minimumZoomScale = zoomScale;
            self.scrollView.zoomScale = zoomScale;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: Any) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, self.imageView.isOpaque, 0.0)
            self.imageView.drawHierarchy(in: self.imageView.bounds, afterScreenUpdates: false)
            let snapshotImageFromMyView = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.imageView.image = snapshotImageFromMyView
        }
        
//        self.dismiss(animated: true, completion: nil)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }
    
    
    

}
