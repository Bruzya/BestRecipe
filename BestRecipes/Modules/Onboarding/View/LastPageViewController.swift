//
//  LastPageViewController.swift
//  BestRecipes
//
//  Created by Drolllted on 09.07.2024.
//

import UIKit

class LastPageViewController: UIViewController {
    
    lazy var backgroundImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(resource: .thirdOnboarding)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill

        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        view.clipsToBounds = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupUI()
        
        constraintsUI()
    }
    
}

private extension LastPageViewController{
        
        func setupUI(){
            view.addSubview(backgroundImageView)
            backgroundImageView.addSubview(overlayView)
        }
        
        func constraintsUI() {
            NSLayoutConstraint.activate([
                backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
                overlayView.topAnchor.constraint(equalTo: view.topAnchor),
                overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        }
        
    
    
    
}
