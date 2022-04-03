//
//  ATView.swift
//  AffineTransformView
//
//  Created by 김혜리 on 2022/03/29.
//

import UIKit
import CoreGraphics

public class ATView: UIView {
    
    
}

// up down left right
extension ATView {
    public func moveDown(y: CGFloat) {
        self.transform = CGAffineTransform(a: 1,
                                           b: 0,
                                           c: 0,
                                           d: 1,
                                           tx: 0,
                                           ty: y)
    }
    
    public func moveUp(y: CGFloat) {
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

// scale up
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

// rotate
extension ATView {
    public func rotateViewClockwise(value: CGFloat) {
        self.transform = CGAffineTransform(a: cos(value),
                                           b: sin(value),
                                           c: -sin(value),
                                           d: cos(value),
                                           tx: 0,
                                           ty: 0)
    }
    
    public func rotateViewAntiClockwise(value: CGFloat) {
        self.transform = CGAffineTransform(a: cos(value),
                                           b: -sin(value),
                                           c: sin(value),
                                           d: cos(value),
                                           tx: 0,
                                           ty: 0)
    }
}

// combining transforms 
extension ATView {
    func combiningTransform(scale scaleValue: CGFloat, rotateClockwise rotateValue: CGFloat) {
        self.transform.scaledBy(x: scaleValue, y: scaleValue).rotated(by: rotateValue)
    }
    
    func combiningTransform(rotateClockwise rotateValue: CGFloat, scale scaleValue: CGFloat) {
        self.transform.rotated(by: rotateValue).scaledBy(x: scaleValue, y: scaleValue)
    }

}

// identity
extension ATView {
    public func defaultView() {
        self.transform = .identity
    }
}

// current postiion
extension ATView {
    // To get pre transform frame
    var originalFrame: CGRect {
        let currentTransform = transform
        transform = .identity
        let originalFrame = frame
        transform = currentTransform
        return originalFrame
    }

    // To get point offset from center
    func centerOffset(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x - center.x,
                       y: point.y - center.y)
    }

    // To get point back relative to center
    func pointRelativeToCenter(_ point: CGPoint) -> CGPoint {
        return CGPoint(x: point.x + center.x,
                       y: point.y + center.y)
    }

    // To get point relative to transformed coords
    func newPointInView(_ point: CGPoint) -> CGPoint {
        // get offset from center
        let offset = centerOffset(point)
        // get transformed point
        let transformedPoint = offset.applying(transform)
        // make relative to center
        return pointRelativeToCenter(transformedPoint)
    }

    var newTopLeft: CGPoint {
        return newPointInView(originalFrame.origin)
    }

    var newTopRight: CGPoint {
        var point = originalFrame.origin
        point.x = point.x + originalFrame.width
        return newPointInView(point)
    }

    var newBottomLeft: CGPoint {
        var point = originalFrame.origin
        point.y = point.y + originalFrame.height
        return newPointInView(point)
    }

    var newBottomRight: CGPoint {
        var point = originalFrame.origin
        point.x = point.x + originalFrame.width
        point.y = point.y + originalFrame.height
        return newPointInView(point)
    }
}
