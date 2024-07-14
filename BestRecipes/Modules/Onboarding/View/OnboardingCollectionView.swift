//
//  OnboardingCollectionView.swift
//  BestRecipes
//
//  Created by Drolllted on 06.07.2024.
//

import UIKit

class OnboardingCollectionView: UIPageViewController {
    
    lazy var pageVC: [UIViewController] = {
        return [LeftPageViewController(), MiddlePageViewController(), LastPageViewController()]
    }()
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
        dataSource = self
        delegate = self
        view.backgroundColor = .red
        
        if let firstViewController = pageVC.first {
            setViewControllers([firstViewController],
                              direction: .forward,
                              animated: true,
                              completion: nil)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    func moveToNextViewController() {
        if let currentViewController = viewControllers?.first,
           let currentIndex = pageVC.firstIndex(of: currentViewController),
           currentIndex < pageVC.count - 1 {
            let nextViewController = pageVC[currentIndex + 1]
            setViewControllers([nextViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
    }
}


