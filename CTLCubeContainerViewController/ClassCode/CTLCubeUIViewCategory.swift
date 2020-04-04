//
//  CTLCubeUIViewCategory.swift
//  CTLCubeContainer
//
//  Created by Linh on 4/3/20.
//  Copyright © 2020 Can Thai Linh. All rights reserved.
//


import UIKit

extension UIView {
    
    func centerSubview(_ subview: UIView, topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil) {
        addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subview.leadingAnchor.constraint(equalTo: leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: trailingAnchor),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor),
            subview.topAnchor.constraint(equalTo: topAnchor ?? self.topAnchor)
            ])
    }
}
extension UIViewController {
    
    func addChildViewController(_ childViewController: UIViewController, superview: UIView, transform: CATransform3D) {
        addChild(childViewController)
        superview.centerSubview(childViewController.view)
        childViewController.view.layer.transform = transform
        childViewController.didMove(toParent: self)
    }
    
    func removeFromParentViewController() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
