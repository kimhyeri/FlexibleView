//
//  ViewController.swift
//  Example
//
//  Created by 김혜리 on 2022/03/29.
//

import UIKit
import EllieFlexibleView

class ViewController: UIViewController {

    let flexibleView = ATView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(flexibleView)
        flexibleView.backgroundColor = .gray
        
        UIView.animate(withDuration: 2) {
            self.flexibleView.moveRight(x: 100)
        }
    }
}

