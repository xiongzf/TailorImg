//
//  Commans.swift
//  TailorImg
//
//  Created by user on 2018/8/16.
//  Copyright © 2018年 xzf. All rights reserved.
//

import Foundation
import UIKit
/// 屏幕大小
let kScreenBounds = UIScreen.main.bounds

/// 屏幕宽度
let kScreenWidth: CGFloat = UIScreen.main.bounds.width

/// 屏幕高度
let kScreenHeight: CGFloat = UIScreen.main.bounds.height


//MARK: - UIView 获取frame，x,y,center
extension UIView {
    
    var XZF_X: CGFloat!{
        
        set{
            var frame = self.frame;
            frame.origin.x = XZF_X!;
            self.frame = frame;
        }
        get{
            return self.frame.origin.x
        }
    }
    
    var XZF_Y: CGFloat!{
        
        set{
            var frame = self.frame;
            frame.origin.x = XZF_Y!;
            self.frame = frame;
        }
        get{
            return self.frame.origin.y
        }
    }
    
    var XZF_width: CGFloat!{
        
        set{
            var frame = self.frame;
            frame.size.width = XZF_width!;
            self.frame = frame;
        }
        get{
            return self.frame.size.width
        }
    }
    
    var XZF_height: CGFloat!{
        
        set{
            var frame = self.frame;
            frame.size.height = XZF_height!;
            self.frame = frame;
        }
        get{
            return self.frame.size.height
        }
    }
    
    var XZF_centerX: CGFloat!{
        
        set{
            var center = self.center;
            center.x = XZF_centerX!;
            self.center = center;
        }
        get{
            return self.center.x
        }
    }
    
    var XZF_centerY: CGFloat!{
        
        set{
            var center = self.center;
            center.y = XZF_centerY!;
            self.center = center;
        }
        get{
            return self.center.y
        }
        
    }
}
