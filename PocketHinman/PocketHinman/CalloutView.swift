//
//  CalloutView.swift
//  PocketHinman
//
//  Created by Ross Harding on 4/6/18.
//  Copyright © 2018 Harding LLC. All rights reserved.
//

import UIKit

class CalloutView: UIView {

    @IBOutlet var contentView: CalloutView!
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var alphaLabel: UILabel!
    @IBOutlet var stepper: UIStepper!
    @IBOutlet var panResizeButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        if self.subviews.count == 0 {
            commonInit()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        if self.subviews.count == 0 {
            commonInit()
        }
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CalloutView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

}
