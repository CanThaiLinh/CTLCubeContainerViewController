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
//
//        print("linh 1 :\(topAnchor.) 2:\(self.topAnchor)")
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
//        superview.centerSubview(childViewController.view, topAnchor: topLayoutGuide.bottomAnchor)
        
        childViewController.view.layer.transform = transform
        childViewController.didMove(toParent: self)
    }
    
    func removeFromParentViewController() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
    func addTopViewAtTopLayOutGuild(_ subview: UIView) {
        view.addSubview(subview)
        view.sendSubviewToBack(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        //
        //        print("linh 1 :\(topAnchor.) 2:\(self.topAnchor)")
        //let heightConstraint = NSLayoutConstraint(item: subview, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
        NSLayoutConstraint.activate([
            subview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subview.bottomAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor),
            subview.topAnchor.constraint(equalTo: self.view.topAnchor)
            ])
    }
    
}
