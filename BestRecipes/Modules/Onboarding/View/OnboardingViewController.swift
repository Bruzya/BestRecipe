//
//  OnboardingViewController.swift
//  BestRecipes
//
//  Created by Evgenii Mazrukho on 30.06.2024.
//

import UIKit

protocol OnboardingViewControllerDelegate: AnyObject {
    func segueCollectionView() 
}

class OnboardingViewController: UIViewController, OnboardingViewControllerDelegate {
    
    var presenter: OnboardingPresenterDelegate?
    
    private lazy var onBoardingImage: UIImageView = {
        let image = UIImageView()
        image.image = .homePage
        image.contentMode = .scaleAspectFit
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var overlayView: CAGradientLayer = {
        let view = CAGradientLayer()
        view.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        view.locations = [0.0, 1.0]
        view.startPoint = CGPoint(x: 0.0, y: 0.0)
        view.endPoint = CGPoint(x: 0.0, y: 1.0)
        view.frame = onBoardingImage.bounds
        onBoardingImage.layer.insertSublayer(view, at: 0)
        return view
    }()
    
    private lazy var overlayViewView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    //MARK: - create recipes label
    
    private lazy var starImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.tintColor = .black
        
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    private lazy var countLoadLabel: UILabel = {
        let label = UILabel()
        label.text = "100k"
        label.font = UIFont(name: "Poppins-Bold", size: 16)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var premiumLabel: UILabel = {
        let label = UILabel()
        label.text = "Premium Recipes"
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var premiumStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 3
        stack.alignment = .center
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    //MARK: - Create Labels name App and Discription
    
    private lazy var nameAppLabel: UILabel = {
        let label = UILabel()
        label.text = "Best Recipe"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins-Bold", size: 56)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var discriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Find best recipes for cooking"
        label.font = UIFont(name: "Poppins-Regular", size: 16)
        label.textColor = .white
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var stackNamedAndDiscription: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .center
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    //MARK: - Start button
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        button.setTitle("Get startes", for: .normal)
        button.titleLabel?.font = UIFont(name: "Poppins-Bold", size: 16)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(segueCollectionView), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        
        setupUI()
        
        constraintsUI()
        
    }
    
    @objc func segueCollectionView() {
        presenter?.onTapButton()
        
    }
    
    
}

private extension OnboardingViewController {
    func configure() {
        view.backgroundColor = .black.withAlphaComponent(0.5)
        
        
    }
    
    func setupUI() {
        
        view.addSubviews(onBoardingImage, starImage, premiumStack, stackNamedAndDiscription, startButton)
        premiumStack.addArrangedSubviews([countLoadLabel, premiumLabel])
        stackNamedAndDiscription.addArrangedSubviews([nameAppLabel, discriptionLabel])
        
    }
    
    func constraintsUI (){
        NSLayoutConstraint.activate([
            onBoardingImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onBoardingImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onBoardingImage.topAnchor.constraint(equalTo: view.topAnchor),
            onBoardingImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            //MARK: - Star Image
            
            starImage.topAnchor.constraint(equalTo: onBoardingImage.safeAreaLayoutGuide.topAnchor, constant: 10),
            starImage.leadingAnchor.constraint(equalTo: onBoardingImage.leadingAnchor, constant: 85),
            starImage.heightAnchor.constraint(equalToConstant: 18),
            starImage.widthAnchor.constraint(equalToConstant: 18),
            
            //MARK: - premium Load Stack
            
            premiumStack.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 5),
            premiumStack.topAnchor.constraint(equalTo: onBoardingImage.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            //MARK: - Named and Discription Label
            
            stackNamedAndDiscription.leadingAnchor.constraint(equalTo: onBoardingImage.leadingAnchor, constant: 35),
            stackNamedAndDiscription.trailingAnchor.constraint(equalTo: onBoardingImage.trailingAnchor, constant: -35),
            stackNamedAndDiscription.topAnchor.constraint(equalTo: premiumStack.bottomAnchor, constant: 411),
            
            //MARK: - Start Button
            
            startButton.leadingAnchor.constraint(equalTo: onBoardingImage.leadingAnchor, constant: 110),
            startButton.trailingAnchor.constraint(equalTo: onBoardingImage.trailingAnchor, constant: -110),
            startButton.topAnchor.constraint(equalTo: stackNamedAndDiscription.bottomAnchor, constant: 5),
            startButton.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
    
}
