//
//  ScratchViewController.swift
//  MaskDemo
//
//  Created by 郑国凯 on 16/8/1.
//  Copyright © 2016年 郑国凯. All rights reserved.
//

import UIKit

class ScratchViewController: UIViewController {

    @IBOutlet weak var imgv_avatar: UIImageView!
    @IBOutlet weak var view_mask: UIView!
    
    private var maskLayer: CAShapeLayer!
    private var path: UIBezierPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSubview()
    }
    
    // MARK: - Configure
    
    private func configureSubview() {
        
        maskLayer = CAShapeLayer()
        path = UIBezierPath()
        
        maskLayer.frame = self.view.bounds
        maskLayer.lineCap = kCALineCapRound
        maskLayer.lineJoin = kCALineJoinRound
        maskLayer.lineWidth = 40.0
        maskLayer.strokeColor = UIColor.redColor().CGColor
        maskLayer.fillColor = nil
        
        self.imgv_avatar.layer.mask = maskLayer
    }
    
    // MARK: - Actions
    
    @IBAction func reset(sender: AnyObject) {
    
        path = UIBezierPath()
        maskLayer.path = nil
        imgv_avatar.layer.mask = maskLayer
    }
    
    @IBAction func showOrHideLayer(sender: AnyObject) {
        if (imgv_avatar.layer.mask == nil) {
            imgv_avatar.layer.mask = maskLayer
        } else {
            imgv_avatar.layer.mask = nil
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = (touches as NSSet).anyObject()
        
        let point = touch?.locationInView(self.view_mask)
        
        path.moveToPoint(point!)
        
        maskLayer.path = path.CGPath
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
      
        let touch = (touches as NSSet).anyObject()
        
        let point = touch?.locationInView(self.view_mask)
        
        path.addLineToPoint(point!)
        
        maskLayer.path = path.CGPath

    }
    
}
