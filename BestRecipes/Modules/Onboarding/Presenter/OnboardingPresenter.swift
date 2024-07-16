//
//  OnboardingPresenter.swift
//  BestRecipes
//
//  Created by Drolllted on 14.07.2024.
//

import UIKit

protocol OnboardingPresenterDelegate: AnyObject{
    init(view: OnboardingViewControllerDelegate, router: RouterProtocol)
    func onTapButtonIn()
}

final class OnBoardingPresenter: OnboardingPresenterDelegate {
    
    weak var view: OnboardingViewControllerDelegate?
    var router: RouterProtocol
    
    init(view: OnboardingViewControllerDelegate, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func onTapButtonIn() {
        print("32123")
        router.goToPageVC()
    }
    
    
}

