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

    @IBOutlet var imageViewWidth: NSLayoutConstraint!
    @IBOutlet var imageViewHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 5
        scrollView.zoomScale = 1
        imageView.image = image
        imageView.frame = scrollView.bounds
        imageView.contentMode = .scaleAspectFit
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
        
//        let croppedCGImage = imageView.image?.cgImage?.cropping(to: cropArea)
//        let croppedImage = UIImage(cgImage: croppedCGImage!)
//        imageView.image = croppedImage
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return imageView
    }
    
//    func crop()  {
//
//        let scale:CGFloat = 1/scrollView.zoomScale
//        let x:CGFloat = scrollView.contentOffset.x * scale
//        let y:CGFloat = scrollView.contentOffset.y * scale
//        let width:CGFloat = scrollView.frame.size.width * scale
//        let height:CGFloat = scrollView.frame.size.height * scale
//        let croppedCGImage = imageView.image?.cgImage?.cropping(to: CGRect(x: x, y: y, width: width, height: height))
//        let croppedImage = UIImage(cgImage: croppedCGImage!)
//
//        setImageToCrop(image: croppedImage)
//    }
//
//    func setImageToCrop(image:UIImage){
//        imageView.image = image
//        imageViewWidth.constant = image.size.width
//        imageViewHeight.constant = image.size.height
//        let scaleHeight = scrollView.frame.size.width/image.size.width
//        let scaleWidth = scrollView.frame.size.height/image.size.height
//        let maxScale = max(scaleWidth, scaleHeight)
//        scrollView.minimumZoomScale = maxScale
//        scrollView.zoomScale = maxScale
//    }
//
//    var cropArea:CGRect{
//        get{
//            let cropAreaView = UIView(frame: CGRect(x: 0, y: scrollView.frame.minY, width: view.frame.width, height: scrollView.frame.height))
//            print("y: \(scrollView.frame.minY)")
//            print("height: \(scrollView.frame.height)")
//            let factor = imageView.image!.size.width/view.frame.width
//            let scale = 1/scrollView.zoomScale
//            let imageFrame = imageView.imageFrame()
//            let x = (scrollView.contentOffset.x + cropAreaView.frame.origin.x - imageFrame.origin.x) * scale * factor
//            let y = (scrollView.contentOffset.y + cropAreaView.frame.origin.y - imageFrame.origin.y) * scale * factor
//            let width = cropAreaView.frame.size.width * scale * factor
//            let height = cropAreaView.frame.size.height * scale * factor
//            return CGRect(x: x, y: y, width: width, height: height)
//        }
//    }

}

//extension UIImageView {
//
//
//    func imageFrame() -> CGRect {
//
//        let imageViewSize = self.frame.size
//        guard let imageSize = self.image?.size else {
//            return CGRect.zero
//        }
//
//        let imageRatio = imageSize.width / imageSize.height
//        let imageViewRatio = imageViewSize.width / imageViewSize.height
//
//        if imageRatio > imageViewRatio {
//            let scaleFactor = imageViewSize.height / imageSize.height
//            let width = imageSize.width * scaleFactor
//            let topLeftX = (imageViewSize.width - width) * 0.5
//            return CGRect(x: topLeftX, y: 0, width: width, height: imageViewSize.height)
//        } else {
//            let scaleFactor = imageViewSize.width / imageSize.width
//            let height = imageSize.height * scaleFactor
//            let topLeftY = (imageViewSize.height - height) * 0.5
//            return CGRect(x: 0, y: topLeftY, width: imageViewSize.width, height: height)
//        }
//
//    }
//
//
//
//}

