//
//  XZFTailorVC.swift
//  TailorImg
//
//  Created by user on 2018/8/16.
//  Copyright © 2018年 xzf. All rights reserved.
//

import UIKit

class XZFTailorVC: UIViewController {
    var clipView: XZFTailorView!
    

}

//MARK: - 生命周期、私人定制
extension XZFTailorVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clipView = XZFTailorView(frame: self.view.frame, originalImg: UIImage(named: "monkey")!)
        clipView.show(clipFrame: CGRect(x: clipView.center.x - 150, y: clipView.center.y - 75, width: 300, height: 150))
        self.view.addSubview(clipView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

//MARK: - 描述
extension XZFTailorVC {
    
}

//MARK: - 描述
extension XZFTailorVC {
    
}

//MARK: - 描述
extension XZFTailorVC {
    
}
