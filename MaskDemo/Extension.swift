//
//  Extension.swift
//  MaskDemo
//
//  Created by 郑国凯 on 16/8/1.
//  Copyright © 2016年 郑国凯. All rights reserved.
//

import UIKit

extension UIImage {
    
    //截屏
    class func printScreenFromView(view: UIView) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, UIScreen.mainScreen().scale)
        
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        
        let img = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return img
        
    }
    
    //获取指定rect区域的截图
    func imageFromRect(rect: CGRect) -> UIImage {
        
        if CGRectEqualToRect(rect, CGRectNull) || CGRectEqualToRect(rect, CGRectZero) {
            return self
        }
        
        let cgImg = CGImageCreateWithImageInRect(self.CGImage, rect)
        
        let img = UIImage(CGImage: cgImg!)
        
        return img
    }
    
}