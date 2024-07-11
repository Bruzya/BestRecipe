//
//  FavoritePresenter.swift
//  BestRecipes
//
//  Created by Руслан Алламбергенов on 07.07.2024.
//

import UIKit

//MARK: - Presenter Protocol

protocol FavoritePresenterProtocol {
    init(view: FavoriteViewProtocol, router: RouterProtocol)
    func backTap()
}


final class FavoritePresenter: FavoritePresenterProtocol {
    
    //MARK: - Properties
    
    weak var view: FavoriteViewProtocol?
    var router: RouterProtocol?
    
    
    //MARK: - Lifecycle
    
    init(view: FavoriteViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    
    //MARK: - External Methods
    
    func backTap() {
        router?.popToRoot()
    }
}

