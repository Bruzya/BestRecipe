//
//  OnBoardingCollectionView.swift
//  BestRecipes
//
//  Created by Drolllted on 07.07.2024.
//

import Foundation
import UIKit

protocol OnboardingCollectionDelegate: AnyObject{
    func setNewsControllers()
}

class OnBoardingCollectionViewPresenter: OnboardingCollectionDelegate {
    
    private var pageViewController: OnboardingCollectionView?
    
    init(pageViewController: OnboardingCollectionView) {
        self.pageViewController = pageViewController
    }
    
    func setNewsControllers() {
        pageViewController?.moveToNextViewController()
    }
    
}
