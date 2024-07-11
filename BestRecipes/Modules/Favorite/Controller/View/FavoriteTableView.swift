//
//  FavoriteTableView.swift
//  BestRecipes
//
//  Created by Руслан Алламбергенов on 07.07.2024.
//

import UIKit
import SwiftUI

final class FavoriteTableView: UITableView {
    
    //MARK: - Properties
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        
        configure()
        setDelegates()
        
        register(FavoriteTableViewCell.self, forCellReuseIdentifier: "BRTrendingTableViewCell")
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate

extension FavoriteTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index\(indexPath)at row\(indexPath.row) ")
        deselectRow(at: indexPath, animated: true)
    }
}


//MARK: - DataSource

extension FavoriteTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 100
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = dequeueReusableCell(withIdentifier: "BRTrendingTableViewCell", for: indexPath) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}


//MARK: - Internal Methods

private extension FavoriteTableView {
    
    //MARK: - Setup UI
    
    func configure() {
        backgroundColor = .none
        bounces = false
        showsVerticalScrollIndicator = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setDelegates() {
        delegate = self
        dataSource = self
    }
}



