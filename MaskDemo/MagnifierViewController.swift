//
//  MagnifierViewController.swift
//  MaskDemo
//
//  Created by 郑国凯 on 16/8/1.
//  Copyright © 2016年 郑国凯. All rights reserved.
//

import UIKit

let MagnifierRadius: CGFloat = 50.0 // 放大半径

class MagnifierViewController: UIViewController {
    
    @IBOutlet weak var imgv_avatar: UIImageView!
    
    var imgv_zoom: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSubviews()
        
    }

    // MARK: - Configure
    
    private func configureSubviews() {
        
        imgv_zoom = UIImageView(frame: CGRect(x: 0, y: 0, width: MagnifierRadius * 2, height: MagnifierRadius * 2))
        imgv_zoom.contentMode = .ScaleToFill
        imgv_zoom.layer.borderWidth = 1.0
        imgv_zoom.layer.borderColor = UIColor.grayColor().CGColor
        imgv_zoom.layer.cornerRadius = MagnifierRadius
        imgv_zoom.layer.masksToBounds = true
        imgv_zoom.alpha = 0.0
        
        UIApplication.sharedApplication().keyWindow?.addSubview(imgv_zoom)
        
    }
    
    // MARK: - Actions
    
    private func showZoomView(point: CGPoint) {
        
        var tempPoint = point
        //因为retina屏,截取到的图片的尺寸会变化
        tempPoint.x = UIScreen.mainScreen().scale * point.x
        tempPoint.y = UIScreen.mainScreen().scale * point.y
        
        imgv_zoom.alpha = 0.0
        
        let width = 2 * MagnifierRadius
        let height = width
        
        let rect = CGRect(x: tempPoint.x - width * 0.5, y: tempPoint.y - height * 0.5, width: width, height: height)
        var img = UIImage.printScreenFromView(self.view.window!)
        
        img = img.imageFromRect(rect)
        
        self.imgv_zoom.alpha = 1.0
        self.imgv_zoom.image = img
        
        var center = imgv_zoom.center
        
        center.x = point.x
        center.y = point.y
        
        imgv_zoom.center = center
    }

    // MARK: - 
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = (touches as NSSet).anyObject()
        
        let point = touch?.locationInView(imgv_avatar)
        
        showZoomView(point!)
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = (touches as NSSet).anyObject()
        
        let point = touch?.locationInView(imgv_avatar)
        
        showZoomView(point!)
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        imgv_zoom.alpha = 0.0
    }

}
