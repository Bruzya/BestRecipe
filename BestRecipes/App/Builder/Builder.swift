//
//  Builder.swift
//  BestRecipes
//
//  Created by Evgenii Mazrukho on 02.07.2024.
//

import UIKit

protocol BuilderProtocol: AnyObject {
    func getMainViewController(router: RouterProtocol) -> UIViewController
    func getTrendingViewController(router: RouterProtocol) -> UIViewController
    func getOnBoardingViewController(router: RouterProtocol) -> UIViewController
    func getOnBoardingCollectionView(router: RouterProtocol) -> UIViewController
}


final class Builder: BuilderProtocol {
    
    
    func getMainViewController(router: RouterProtocol) -> UIViewController {
        let viewController = MainViewController()
        let presenter = MainPresenter(view: viewController, router: router)
        viewController.presenter = presenter
        
        return viewController
    }
    
    
    func getTrendingViewController(router: RouterProtocol) -> UIViewController {
        let viewController = TrendingViewController()
        let presenter = TrendingPresenter(view: viewController, router: router)
        viewController.presenter = presenter
        
        return viewController
    }
    
    func getOnBoardingViewController(router: any RouterProtocol) -> UIViewController {
        let viewController = OnboardingViewController()
        let presenter = OnBoardingPresenter(view: viewController, router: router)
        viewController.presenter = presenter
        
        return viewController
    }
    
    func getOnBoardingCollectionView(router: any RouterProtocol) -> UIViewController {
        let viewController = OnboardingCollectionView()
       // let presenter = OnBoardingCollectionViewPresenter()
        return viewController
    }
}
