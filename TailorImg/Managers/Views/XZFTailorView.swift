//
//  XZFTailorView.swift
//  TailorImg
//
//  Created by user on 2018/8/16.
//  Copyright © 2018年 xzf. All rights reserved.
//

import UIKit

class XZFTailorView: UIView {

    private var clipFrame: CGRect!
    private var image: UIImage! // 原始图片
    private var imgView: UIImageView = UIImageView() //图片视图

    private var imgRatio: CGFloat! //图片原始比例

    init(frame: CGRect, originalImg: UIImage) { //初始化
        super.init(frame: frame)
        image = originalImg
        imgRatio = originalImg.size.width / originalImg.size.height
        imgView.bounds = CGRect(x: 0, y: 0, width: kScreenWidth - 40, height: (kScreenWidth - 40) / imgRatio)
        imgView.center = self.center
        imgView.isUserInteractionEnabled = true
        imgView.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: 显示
    func show(clipFrame: CGRect) {
        self.clipFrame = clipFrame
        drawClipPath()
        addPanView()
        self.addSubview(imgView)
        self.sendSubview(toBack: imgView)
    }
}

//MARK: - 描述
extension XZFTailorView {
    //MARK: 添加拖拽视图以及拖拽手势
    func addPanView() {
        for i in 0..<4 {
            let cornerView = UIView()
            cornerView.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
            cornerView.backgroundColor = UIColor.white
            
            let row = i / 2
            let col = i % 2
            
            cornerView.center = CGPoint(x: clipFrame.minX + clipFrame.width * CGFloat(col), y: clipFrame.minY + clipFrame.height * CGFloat(row))
            let pan = UIPanGestureRecognizer(target: self, action: #selector(panGestures(panGesture:)))
            cornerView.addGestureRecognizer(pan)
            cornerView.tag = 1000 + i
            self.addSubview(cornerView)
        }
        
        for i in 0..<4 {
            let sideView = UIView()
            sideView.tag = 2000 + i
            sideView.backgroundColor = UIColor.blue

            let row = i / 2
            let col = i % 2

            sideView.bounds = CGRect(x: 0, y: 0, width: col == 0 ? 30 : clipFrame.width - 30 * 2 , height: col == 0 ? clipFrame.height - 30 * 2 : 30)
            sideView.center = CGPoint(x: col == 0 ? (clipFrame.origin.x + CGFloat(row) * clipFrame.width) : clipFrame.midX, y: col == 0 ? clipFrame.midY : (clipFrame.origin.y + CGFloat(row) * clipFrame.height))
            let pan = UIPanGestureRecognizer(target: self, action: #selector(panGestures(panGesture:)))
            sideView.addGestureRecognizer(pan)
            sideView.tag = 2000 + i
            self.addSubview(sideView)
        }
    }
    
    
    @objc func panGestures(panGesture: UIPanGestureRecognizer) {
        let panView = panGesture.view
        let point = panGesture.translation(in: panView)
        print(point)
        if (panView?.tag)! < 2000 {
            clipFrame.origin.x += point.x
            clipFrame.origin.y += point.y
        } else if panView?.tag == 2000 || panView?.tag == 2002 {
            clipFrame.origin.x += point.x
        } else {
            clipFrame.origin.y += point.y
        }
        
        panGesture.setTranslation(.zero, in: panView)
        drawClipPath()
    }
    
    //MARK: 绘制阴影
    func drawClipPath() {
        for layer in self.layer.sublayers ?? [] {
            if layer.isMember(of: CAShapeLayer.self) {
                layer.removeFromSuperlayer()
            }
        }
        
        let path = UIBezierPath(rect: self.bounds)
        let layer = CAShapeLayer()
        
        let clipPath = UIBezierPath(rect: clipFrame)
        
        path.append(clipPath)
        path.usesEvenOddFillRule = true
        layer.path = path.cgPath
        layer.fillRule = kCAFillRuleEvenOdd
        layer.fillColor = UIColor.black.cgColor
        layer.opacity = 0.5
        
        self.layer.addSublayer(layer)
        
        //添加线
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = CGRect(x: 0, y: 0, width: clipFrame.width, height: clipFrame.height)
        shapeLayer.path = clipPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.strokeColor = UIColor.white.cgColor
        self.layer.addSublayer(shapeLayer)
        
    }
    
    
}



























