//
//  LexiUIButton.swift
//  potsApptest
//
//  Created by Lexi on 04/02/2016.
//  Copyright © 2016 LexiTechsy. All rights reserved.
//

import UIKit

class LexiUIButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

        override func titleRectForContentRect(contentRect: CGRect) -> CGRect
        {
            let rect = super.titleRectForContentRect(contentRect)
            
            return CGRectMake(0, CGRectGetHeight(contentRect) - CGRectGetHeight(rect),
                CGRectGetWidth(contentRect), CGRectGetHeight(rect))
        }
        
        override func imageRectForContentRect(contentRect: CGRect) -> CGRect
        {
            let rect = super.imageRectForContentRect(contentRect)
            let titleRect = titleRectForContentRect(contentRect)
            
            return CGRectMake(CGRectGetWidth(contentRect)/2.0 - CGRectGetWidth(rect)/2.0,
                (CGRectGetHeight(contentRect) - CGRectGetHeight(titleRect))/2.0 - CGRectGetHeight(rect)/2.0,
                CGRectGetWidth(rect), CGRectGetHeight(rect))
        }
        
        override func intrinsicContentSize() -> CGSize
        {
            let size = super.intrinsicContentSize()
            
            if let image = imageView?.image
            {
                var labelHeight: CGFloat = 0.0
                
                if let size = titleLabel?.sizeThatFits(CGSizeMake(CGRectGetWidth(self.contentRectForBounds(self.bounds)), CGFloat.max))
                {
                    labelHeight = size.height
                }
                
                return CGSizeMake(size.width, image.size.height + labelHeight)
            }
            
            return size
        }
        
        override init(frame: CGRect)
        {
            super.init(frame: frame)
            centerTitleLabel()
        }
        
        required init?(coder aDecoder: NSCoder)
        {
            super.init(coder: aDecoder)
            centerTitleLabel()
        }
        
        private func centerTitleLabel()
        {
            self.titleLabel?.textAlignment = .Center
        }
    }


