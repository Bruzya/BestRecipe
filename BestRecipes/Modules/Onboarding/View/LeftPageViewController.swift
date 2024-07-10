//
//  LeftPageViewController.swift
//  BestRecipes
//
//  Created by Drolllted on 09.07.2024.
//

import UIKit

class LeftPageViewController: UIViewController{
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var backgroundImageView: UIImageView = {
        let image = UIImageView(frame: view.bounds)
        image.image = .firstOnboarding
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        view.clipsToBounds = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var textLabelView: UILabel = {
        let label = UILabel()
        label.text = "Recipes from all over the World"
        label.font = UIFont(name: "Poppins-Bold", size: 40)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 3
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var pageIndicator: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        return view
    }()
    
    private lazy var pageIndicatorNon: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        return view
    }()
    
    private lazy var pageIndicatorNon1: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        view.widthAnchor.constraint(equalToConstant: 45).isActive = true
        
        return view
    }()
    
    private lazy var stackIndicator: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        stack.alignment = .center
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        
        return stack
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupUI()
        
        constraintsUI()
    }
    
    
}

private extension LeftPageViewController{
    
    func setupUI(){
        view.addSubview(backView)
        backView.addSubviews(backgroundImageView, overlayView, textLabelView, stackIndicator)
        stackIndicator.addArrangedSubviews([pageIndicator, pageIndicatorNon, pageIndicatorNon1])
    }
    
    func constraintsUI() {
        NSLayoutConstraint.activate([
            
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backView.topAnchor.constraint(equalTo: view.topAnchor),
            
            backgroundImageView.topAnchor.constraint(equalTo: backView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
        
            overlayView.topAnchor.constraint(equalTo: backView.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: backView.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            
            textLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            textLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            textLabelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            
            stackIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackIndicator.topAnchor.constraint(equalTo: textLabelView.bottomAnchor, constant: 30),
            stackIndicator.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
}
