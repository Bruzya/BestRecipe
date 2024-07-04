//
//  DetailViewController.swift
//  BestRecipes
//
//  Created by Evgenii Mazrukho on 30.06.2024.
//

import UIKit

final class DetailViewController: UIViewController {
    
    private let customView = DetailView()
    
    override func loadView() {
        self.view = customView
        //        navigationBarCustom()
    }
}
//
//
//extension DetailViewController {
//
//    func navigationBarCustom() {
//        navigationItem.title = "Recipe detail".uppercased()
//        let backButton = UIButton()
//        backButton.setImage(UIImage(named: "arrowBackNavigation"), for: UIControl.State())
//        backButton.addTarget(self, action: #selector(actionBackNavigationButton), for: UIControl.Event.touchUpInside)
//        let leftBarButtonItem = UIBarButtonItem(customView: backButton)
//        navigationItem.leftBarButtonItem = leftBarButtonItem
//    }
//    @objc func actionBackNavigationButton() {
//        navigationController?.popViewController(animated: true)
//    }
//}
//
