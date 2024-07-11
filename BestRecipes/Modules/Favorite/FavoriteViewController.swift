//
//  FavoriteViewController.swift
//  BestRecipes
//
//  Created by realeti on 04.07.2024.
//

import UIKit
import SwiftUI

protocol FavoriteViewProtocol: AnyObject {
    
}


final class FavoriteViewController: UIViewController, TrendingViewProtocol {
    
    //MARK: - TEST router + presenter + builder
    
    var presenter: TrendingPresenterProtocol?
    
    
    
    
    private let tableView = FavoriteTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Saved recipes"
        view.addSubview(tableView)
        view.backgroundColor = .white
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

//MARK: - Расширение для превью Превью

extension UINavigationController {
    
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        func makeUIViewController (context: Context) -> some UIViewController {
            viewController
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
    func showPreview() -> some View {
        Preview(viewController: self).edgesIgnoringSafeArea(.all)
    }
}

//MARK: - Превью

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        UINavigationController (rootViewController: FavoriteViewController()).showPreview()
        
    }
}
