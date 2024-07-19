//
//  CreateRecipeView.swift
//  BestRecipes
//
//  Created by nik on 09.07.24.
//

import UIKit

protocol CreateRecipeViewDelegate: AnyObject {
    func createRecipeButtonPressed()
}

class CreateRecipeView: UIView {
    
    //MARK: - Dependencies
    weak var delegate: CreateRecipeViewDelegate?
    
    //MARK: - Private UI properties
    private let createRecipeButtom: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create recipe", for: .normal)
        button.titleLabel?.font = Font.getFont(.poppinsRegular, size: 16)
        button.tintColor = .white
        button.backgroundColor = .redBase
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Public UI Properties
    let tableView: UITableView = {
        let table = UITableView()
        //table.backgroundColor = .none
        //table.separatorStyle = .none
        //table.bounces = false
        //table.showsVerticalScrollIndicator = false
        
        table.register(
            UITableViewCell.self, forCellReuseIdentifier: "cell"
        )
        
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    //MARK: - Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Selectors
private extension CreateRecipeView {
    @objc func createRecipeButtonClicked() {
        print("CreateRecipeView -> createRecipeButtonClicked()")
        delegate?.createRecipeButtonPressed()
    }
}

//MARK: - Setup UI
private extension CreateRecipeView {
    func setupViews() {
        addSubviews(
            tableView,
            createRecipeButtom
        )
    }
    
    func setupTargetAction() {
        createRecipeButtom.addTarget(
            self,
            action: #selector(createRecipeButtonClicked),
            for: .touchUpInside
        )
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -80),
            
            createRecipeButtom.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 13),
            createRecipeButtom.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            createRecipeButtom.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            createRecipeButtom.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}













//
//
//
//MARK: - UIViewControllerRepresentable
import SwiftUI

extension UIViewController {
    struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> some UIViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    }
    
    func preview() -> some View {
        Preview(viewController: self).edgesIgnoringSafeArea(.all)
    }
}

struct CreateRecipeProvider: PreviewProvider {
    static var previews: some View {
        Group {
            UINavigationController(rootViewController: CreateRecipeViewController()).preview()
        }
    }
}
