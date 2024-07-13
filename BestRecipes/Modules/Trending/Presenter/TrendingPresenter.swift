//
//  TrendingPresenter.swift
//  BestRecipes
//
//  Created by realeti on 13.07.2024.
//

import UIKit

protocol TrendingViewProtocol: AnyObject {
    
}

protocol TrendingPresenterProtocol {
    init(view: TrendingViewProtocol, router: RouterProtocol)
    func backTap()
}


final class TrendingPresenter: TrendingPresenterProtocol {
    
    //MARK: - Properties
    
    weak var view: TrendingViewProtocol?
    var router: RouterProtocol?
    
    
    //MARK: - Lifecycle
    
    init(view: TrendingViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    
    //MARK: - External Methods
    
    func backTap() {
        router?.popToRoot()
    }
}
