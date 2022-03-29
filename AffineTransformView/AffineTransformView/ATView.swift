//
//  ATView.swift
//  AffineTransformView
//
//  Created by 김혜리 on 2022/03/29.
//

import UIKit

public class ATView: UIView {
    
    
}

// up down left right
extension ATView {
    public func moveUp(y: CGFloat) {
        self.transform = CGAffineTransform(a: 1,
                                           b: 0,
                                           c: 0,
                                           d: 1,
                                           tx: 0,
                                           ty: y)
    }
    
    public func moveDown(y: CGFloat) {
        self.transform = CGAffineTransform(a: 1,
                                           b: 0,
                                           c: 0,
                                           d: 1,
                                           tx: 0,
                                           ty: -y)
    }
    
    public func moveLeft(x: CGFloat) {
        self.transform = CGAffineTransform(a: 1,
                                           b: 0,
                                           c: 0,
                                           d: 1,
                                           tx: -x,
                                           ty: 0)
    }
    
    public func moveRight(x: CGFloat) {
        self.transform = CGAffineTransform(a: 1,
                                           b: 0,
                                           c: 0,
                                           d: 1,
                                           tx: x,
                                           ty: 0)
    }
}

extension ATView {
    public func scaleUp(value: CGFloat) {
        self.transform = CGAffineTransform(a: value,
                                           b: 0,
                                           c: 0,
                                           d: value,
                                           tx: 0,
                                           ty: 0)
    }
}

extension ATView {
    public func rotateView(value: CGFloat) {
        self.transform = CGAffineTransform(a: cos(value),
                                           b: sin(value),
                                           c: -sin(value),
                                           d: cos(value),
                                           tx: 0,
                                           ty: 0)
    }
}

extension ATView {
    public func defaultView() {
        self.transform = .identity
    }
}
