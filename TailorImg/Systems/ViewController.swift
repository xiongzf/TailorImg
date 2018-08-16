//
//  ViewController.swift
//  TailorImg
//
//  Created by user on 2018/8/16.
//  Copyright © 2018年 xzf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func jump(_ sender: UIButton) {
        let vc = XZFTailorVC()
        self.present(vc, animated: true, completion: nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

