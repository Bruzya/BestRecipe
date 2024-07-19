//
//  CreateRecipePresenter.swift
//  BestRecipes
//
//  Created by nik on 09.07.24.
//

import Foundation

protocol CreateRecipePresenterProtocol: AnyObject {
    init(vc: CreateRecipeViewControllerProtocol, router: RouterProtocol)
    var numberOfRows: Int { get }
    func viewDidLoad()
    func createRecipe()
    func goBack()
}

final class CreateRecipePresenter: CreateRecipePresenterProtocol {
    private unowned let vc: CreateRecipeViewControllerProtocol
    private let router: RouterProtocol
    
    var numberOfRows: Int {
        10
    }
    
    init(vc: CreateRecipeViewControllerProtocol, router: RouterProtocol) {
        self.vc = vc
        self.router = router
    }
    
    func viewDidLoad() {
        print("CreateRecipePresenterProtocol -> viewDidLoad()")
    }
    
    func createRecipe() {
        router.popToPrevious()
    }
    
    func goBack() {
        router.popToPrevious()
    }
}
