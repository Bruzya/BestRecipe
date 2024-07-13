//
//  TrendingViewController.swift
//  BestRecipes
//
//  Created by realeti on 13.07.2024.
//

import UIKit

final class TrendingViewController: UIViewController {
    // MARK: - Public Properties
    var presenter: TrendingPresenterProtocol!
    
    // MARK: - Private properties
    private var trendingView: TrendingView!
    
    // MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        
        trendingView = TrendingView()
        view = trendingView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
}

// MARK: - Set Delegates
extension TrendingViewController {
    private func setDelegates() {
        trendingView.trendingCollection.dataSource = self
        trendingView.trendingCollection.delegate = self
    }
}

// MARK: - Trending Delegate methods
extension TrendingViewController: TrendingViewProtocol {
    
}

// MARK: - CollectionView DataSource methods
extension TrendingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.trendingCell, for: indexPath) as? TrendingViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupMockData()
        return cell
    }
}

// MARK: - CollectionView Delegate methods
extension TrendingViewController: UICollectionViewDelegate {
    /// collection selected item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? TrendingViewCell else {
            return
        }
        
        print("cell #\(indexPath.row)")
    }
}

// MARK: - CollectionView FlowLayout Delegate methods
extension TrendingViewController: UICollectionViewDelegateFlowLayout {
    /// collection item  size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth, height: collectionViewWidth * 0.75)
    }
}
