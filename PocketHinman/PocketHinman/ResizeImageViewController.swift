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
    
    var offset: CGPoint?
    var zoomScale: CGFloat?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Current
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = self.scrollView.frame.size.width / self.imageView.frame.size.width
        scrollView.maximumZoomScale = 5
        scrollView.zoomScale = 1
        imageView.image = image
        imageView.frame = scrollView.bounds
        scrollView.clipsToBounds = true
        scrollView.contentSize = imageView.bounds.size

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func done(_ sender: Any) {
        offset = scrollView.contentOffset
        zoomScale = scrollView.zoomScale
        print("offset: \(offset!)")
        print("zoomScale: \(zoomScale!)")
        
        performSegue(withIdentifier: "unwindSegue", sender: self)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }
    

}

