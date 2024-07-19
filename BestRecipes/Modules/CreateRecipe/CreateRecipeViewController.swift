//
//  CreateRecipeViewController.swift
//  BestRecipes
//
//  Created by nik on 10.07.24.
//

import UIKit

protocol CreateRecipeViewControllerProtocol: AnyObject {
}

final class CreateRecipeViewController: UIViewController {
    
    private var createRecipeView: CreateRecipeView?
    var presenter: CreateRecipePresenterProtocol?
    
    override func loadView() {
        createRecipeView = CreateRecipeView()
        createRecipeView?.delegate = self
        view = createRecipeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createRecipeView?.tableView.dataSource = self
        createRecipeView?.tableView.delegate = self
                
        view.backgroundColor = .systemPink
        
        presenter?.viewDidLoad()
    }
    
}

//MARK: - CreateRecipeViewControllerProtocol{
extension CreateRecipeViewController: CreateRecipeViewControllerProtocol {
}

//MARK: - CreateRecipeViewDelegate
extension CreateRecipeViewController: CreateRecipeViewDelegate {
    func createRecipeButtonPressed() {
        print("CreateRecipeViewController -> createRecipeButtonPressed()")
    }
}

//MARK: - UITableViewDataSource
extension CreateRecipeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRows ?? 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension CreateRecipeViewController: UITableViewDelegate {
    
}
