//
//  CTLCubeSide.swift
//  CTLCubeContainer
//
//  Created by Linh on 4/3/20.
//  Copyright © 2020 Can Thai Linh. All rights reserved.
//

import Foundation

enum CTLCubeSide: Int {
    case front = 0
    case right
    case back
    case left
    case count
    
    init(index: Int) {
        let relativeIndex = index % CTLCubeSide.count.rawValue
        self = CTLCubeSide(rawValue: relativeIndex)!
    }
    
    func nextSide() -> CTLCubeSide {
        switch self {
        case .front:    return .right
        case .right:    return .back
        case .back:     return .left
        case .left:     return .front
        default:        return .front
        }
    }
    
    func prevSide() -> CTLCubeSide {
        switch self {
        case .front:    return .left
        case .right:    return .front
        case .back:     return .right
        case .left:     return .back
        default:        return .front
        }
    }
    
    /**
     Returns the cube-transform for the given cube side
     */
    func viewTransform(in parentView: UIView) -> CATransform3D {
        let distance = parentView.bounds.size.width / 2.0
        
        switch self {
        case .front:
            //Translate z towards camera
            return CATransform3DMakeTranslation(0, 0, distance)
        case .right:
            //Translate x right
            let transform = CATransform3DMakeTranslation(distance, 0, 0)
            //Rotate y 90 degrees
            return CATransform3DRotate(transform, .pi / 2.0, 0, 1, 0)
        case .left:
            //Translate x left
            let transform = CATransform3DMakeTranslation(-distance, 0, 0)
            //Rotate y -90 degrees
            return CATransform3DRotate(transform, -(.pi / 2.0), 0, 1, 0)
        case .back:
            //Translate z away from camera
            let transform = CATransform3DMakeTranslation(0, 0, -distance)
            //Rotate y 180 degrees
            return CATransform3DRotate(transform, .pi, 0, 1, 0)
        default:
            return CATransform3DIdentity
        }
    }
    
    /**
     Returns the perspective transform required to see the view at each side
     */
    func perspectiveTransform(in parentView: UIView) -> CATransform3D {
        let distance = parentView.bounds.size.width / 2.0
        
        //Apply perspective prior to transform
        var transform = CATransform3DIdentity
        transform.m34 = matrix34Value
        
        //Translate camera away
        transform = CATransform3DTranslate(transform, 0, 0, -distance)
        
        switch self {
        case .right:
            //Rotate y -90 degrees
            transform = CATransform3DRotate(transform, -(.pi / 2.0), 0, 1, 0)
        case .left:
            //Rotate y 90 degrees
            transform = CATransform3DRotate(transform, (.pi / 2.0), 0, 1, 0)
        case .back:
            //Rotate y -180 degrees
            transform = CATransform3DRotate(transform, -.pi, 0, 1, 0)
        default:
            break
        }
        return transform
    }
}
