//
//  TabBarShape.swift
//  BestRecipes
//
//  Created by realeti on 02.07.2024.
//

import UIKit

protocol ShapeLayerProtocol: CAShapeLayer {
    init(size: CGSize)
}

extension ShapeLayerProtocol {
    init() {
        fatalError("init() cannot be used to create an instance.")
    }
}

final class TabBarShape: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize) {
        super.init()
        
        path = createPath(with: size)
        lineWidth = 3.0
        strokeColor = UIColor.white.cgColor
        fillColor = UIColor.white.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Create Bezier Path
extension TabBarShape {
    private func createPath(with size: CGSize) -> CGPath {
        let path = UIBezierPath()
        
        // Start point
        path.move(to: CGPoint(x: 0, y: 0))
        
        // Line to left curve start
        path.addLine(to: CGPoint(x: (size.width / 2) - 70, y: 0))
        
        // Curve down
        path.addCurve(
            to: CGPoint(x: size.width / 2, y: 50),
            controlPoint1: CGPoint(x: (size.width / 2) - 35, y: 0),
            controlPoint2: CGPoint(x: size.width / 2 - 35, y: 50)
        )
        
        // Curve up
        path.addCurve(
            to: CGPoint(x: (size.width / 2) + 70, y: 0),
            controlPoint1: CGPoint(x: size.width / 2 + 35, y: 50),
            controlPoint2: CGPoint(x: size.width / 2 + 35, y: 0)
        )
        
        // Line to end point
        path.addLine(to: CGPoint(x: size.width, y: 0))
        
        // Lines to close the path
        path.addLine(to: CGPoint(x: size.width, y: size.height))
        path.addLine(to: CGPoint(x: 0, y: size.height))
        path.close()
        
        return path.cgPath
    }
}
