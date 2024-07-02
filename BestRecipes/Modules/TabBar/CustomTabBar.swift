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
    private var plusButtonCenterXConstraint: NSLayoutConstraint?
    
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
        print(plusButton.frame.size.width)
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

// MARK: - Setup Constraints
extension CustomTabBar {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            plusButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            plusButton.centerYAnchor.constraint(equalTo: topAnchor, constant: Metrics.plusButtonTopIndent),
            plusButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: Metrics.plusButtonMultiplier),
            plusButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: Metrics.plusButtonMultiplier)
        ])
    }
}

// MARK: - Actions
extension CustomTabBar {
    @objc private func plusButtonPressed(_ sender: UIButton) {
        print("click plus button")
    }
}

// MARK: - Hit test
extension CustomTabBar {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        plusButton.frame.contains(point) ? plusButton : super.hitTest(point, with: event)
    }
}

// MARK: - Metrics
fileprivate struct Metrics {
    static let plusButtonTopIndent: CGFloat = 6.0
    static let plusButtonMultiplier: CGFloat = 0.56
    static let itemSpacing: CGFloat = 24.0
    
    private init () {}
}
