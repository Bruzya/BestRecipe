//
//  OnboardingCollectionView.swift
//  BestRecipes
//
//  Created by Drolllted on 14.07.2024.
//

import Foundation
import UIKit

protocol OnboardingCollectionDelegate: AnyObject{
    func setNewsControllers()
}

class OnBoardingCollectionViewPresenter: OnboardingCollectionDelegate {
    
    weak var view: OnboardingCollectionProtocol?
    var router: RouterProtocol?
    
    init(view: OnboardingCollectionProtocol?, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func setNewsControllers() {
        print("11111")
    }
    
}
