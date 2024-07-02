//
//  CustomTabBar.swift
//  BestRecipes
//
//  Created by realeti on 01.07.2024.
//

import UIKit

class CustomTabBar: UITabBar {
    // MARK: - Private properties
    private var shapeLayer: CALayer?
    private let plusButton = PlusButton(type: .system)
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        configureUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configureShape()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        /*let height = 90.0
        var tabFrame = self.frame
        tabFrame.size.height = height
        tabFrame.origin.y = self.frame.origin.y + self.frame.height - height
        self.frame = tabFrame*/
    }
    
    // MARK: - Set Views
    private func setupUI() {
        addSubview(plusButton)
    }
    
    // MARK: - Configure UI
    private func configureUI() {
        plusButton.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
    }
}

// MARK: - Setup Constraints
extension CustomTabBar {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            plusButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            plusButton.centerYAnchor.constraint(equalTo: topAnchor),
            plusButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            plusButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6)
        ])
    }
}

// MARK: - Hit test
extension CustomTabBar {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        plusButton.frame.contains(point) ? plusButton : super.hitTest(point, with: event)
    }
}

// MARK: - Configure Shape
extension CustomTabBar {
    private func configureShape() {
        let shapeLayer = TabBarShape(size: frame.size)
        
        if let oldShapeLayer = self.shapeLayer {
            oldShapeLayer.removeFromSuperlayer()
        }
        
        self.layer.insertSublayer(shapeLayer, at: 0)
        self.shapeLayer = shapeLayer
    }
}

// MARK: - Actions
extension CustomTabBar {
    @objc private func plusButtonPressed(_ sender: UIButton) {
        print("click plus button")
    }
}
