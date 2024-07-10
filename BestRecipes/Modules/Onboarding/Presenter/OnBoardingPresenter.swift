//
//  OnBoardingPresenter.swift
//  BestRecipes
//
//  Created by Drolllted on 06.07.2024.
//

import UIKit

protocol OnboardingPresenterDelegate: AnyObject{
    func onTapButton()
    func segueNextView()
}

class OnBoardingPresenter: OnboardingPresenterDelegate {
    
    weak var view: OnboardingViewControllerDelegate?
    var router: RouterProtocol
    
    init(view: OnboardingViewControllerDelegate, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func onTapButton() {
        router.pushOBInCV()
        print("111")
    }
    
    func segueNextView() {
        
    }
    
}
