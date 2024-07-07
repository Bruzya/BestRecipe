//
//  BRCollectionView.swift
//  BestRecipes
//
//  Created by Evgenii Mazrukho on 01.07.2024.
//

import UIKit

final class BRCollectionView: UICollectionView {
    
    //MARK: - Properties
    
    private let collectionLayout = UICollectionViewLayout()
//    private(set) var sections = BRMockData.shared.pageData
    
    
    private var sections: [SectionType]
    
    
    weak var presenterDelegate: MainPresenterProtocol?
    
    private let categoryesNamesData: [BRCategoryName] = [
        .init(categoryName: "Main course", nameForRequest: "main%20course", isSelected: true),
        .init(categoryName: "Side dish", nameForRequest: "side%20dish"),
        .init(categoryName: "Dessert", nameForRequest: "dessert"),
        .init(categoryName: "Appetizer", nameForRequest: "appetizer"),
        .init(categoryName: "Salad", nameForRequest: "salad"),
        .init(categoryName: "Bread", nameForRequest: "bread"),
        .init(categoryName: "Breakfast", nameForRequest: "breakfast"),
        .init(categoryName: "Soup", nameForRequest: "soup"),
        .init(categoryName: "Beverage", nameForRequest: "beverage"),
        .init(categoryName: "Sauce", nameForRequest: "sauce"),
        .init(categoryName: "Marinade", nameForRequest: "marinade"),
        .init(categoryName: "Finger food", nameForRequest: "fingerfood"),
        .init(categoryName: "Snack", nameForRequest: "snack"),
        .init(categoryName: "Drink", nameForRequest: "drink")
    ]
    
    
    //MARK: - Lifecycle
    
    init(presenterDelegate: MainPresenterProtocol, sections: [SectionType]) {
        self.presenterDelegate = presenterDelegate
        self.sections = sections
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        
        configure()
        registerCells()
        registerHeaderAndFooter()
        setDelegates()
    }
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - Delegate

extension BRCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        print("Ячейка в секции \(indexPath.section) и номер \(indexPath.item) была нажата.")
        
        switch indexPath.section {
        case 0:
            print(indexPath.item)
        case 1:
            print(indexPath.item)
        case 2:
            print(indexPath.item)
        case 3:
            print(indexPath.item)
        case 4:
            print(indexPath.item)
        default:
            break
        }
    }
}

//MARK: - External

extension BRCollectionView {
    func updateContent() {
        reloadData()
    }
}


//MARK: - DataSource

extension BRCollectionView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = sections[section]
        switch type {
        case .trending(let model):
            return model.count
        case .category(let model):
            return model.count
        case .popular(let model):
            return model.count
        case .recent(let model):
            return model.count
        case .cuisine(let model):
            return model.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        //MARK: - Header & Footer
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = dequeueReusableSupplementaryView(ofKind: kind,
                                                                withReuseIdentifier: BRSeeAllHeader.idHeader, for: indexPath) as? BRSeeAllHeader else {
                return UICollectionReusableView()
            }
            
            header.tag = indexPath.section
            header.delegate = presenterDelegate
            header.configureHeader(title: sections[indexPath.section].title, section: indexPath.section)
            
            return header
            
        case UICollectionView.elementKindSectionFooter:
            guard let footer = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BRTrendingFooter.idFooter, for: indexPath) as? BRTrendingFooter else {
                return UICollectionReusableView()
            }
            
            return footer
            
        default:
            return UICollectionReusableView()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let type = sections[indexPath.section]
        switch type {
        case .trending(model: let models):
            guard let cell = dequeueReusableCell(withReuseIdentifier: BRTrendingCollectionViewCell.identifier,
                                                 for: indexPath) as? BRTrendingCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let model = models[indexPath.row]
            cell.configure(with model: model)
            return cell
            
        case .category(model: let model):
            guard let cell = dequeueReusableCell(withReuseIdentifier: BRCategoryCollectionViewCell.identifier,
                                                 for: indexPath) as? BRCategoryCollectionViewCell else {
                return UICollectionViewCell()
            }
            let currentCategory = categoryesNamesData[indexPath.row].categoryName
            cell.configureCell(category: currentCategory)
            
            return cell
        case .popular(model: let model):
            guard let cell = dequeueReusableCell(withReuseIdentifier: BRPopularCollectionViewCell.identifier,
                                                 for: indexPath) as? BRPopularCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.configureCell(image: popular[indexPath.row].image ?? .media2,
                               title: popular[indexPath.row].title,
                               time: popular[indexPath.row].timeRemaining)
            
            cell.favoritesButton.delegate = presenterDelegate
            
            return cell
        case .recent(model: let model):
            guard let cell = dequeueReusableCell(withReuseIdentifier: BRRecentCollectionViewCell.identifier,
                                                 for: indexPath) as? BRRecentCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.configureCell(image: recent[indexPath.row].image!,
                               title: recent[indexPath.row].title,
                               authorName: recent[indexPath.row].author)
            
            return cell
        case .cuisine(model: let model):
            guard let cell = dequeueReusableCell(withReuseIdentifier: BRCuisineCollectionViewCell.identifier,
                                                 for: indexPath) as? BRCuisineCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.configureCell(image: cuisine[indexPath.row].image ?? .avatar,
                               title: cuisine[indexPath.row].title)
            
            return cell
        }
    }
}


//MARK: - Internal Methods

private extension BRCollectionView {
    
    //MARK: - Create Layout
    
//    func createLayout() -> UICollectionViewCompositionalLayout {
//        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
//            guard let self else { return nil }
//            let section = sections[sectionIndex]
//            switch section {
//            case .trending:
//                return createTrendingSection()
//            case .category:
//                return createCategorySection()
//            case .popular:
//                return createPopularSection()
//            case .recent:
//                return createRecentSection()
//            case .cuisine:
//                return createCuisineSection()
//            }
//        }
//    }
    
    
    func createSectionTypeLayout(section: Int) -> NSCollectionLayoutSection {
        switch section {
        case 0:
            createTrendingSection()
        case 1:
            createCategorySection()
        case 2:
            createPopularSection()
        case 3:
            createRecentSection()
        case 4:
            createCuisineSection()
        default:
            createTrendingSection()
        }
    }
    
    
    //MARK: - Configure Sections
    
    func createLayoutSection(group: NSCollectionLayoutGroup,
                             behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                             interGroupSpacing: CGFloat,
                             supplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItems
        section.supplementariesFollowContentInsets = false
        return section
    }
    
    
    //MARK: - Header
    
    func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(20)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
    
    
    //MARK: - Footer
    
    func supplementaryFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(20)),
              elementKind: UICollectionView.elementKindSectionFooter,
              alignment: .bottom,
              absoluteOffset: CGPoint(x: 0, y: 25))
    }
    
    
    //MARK: - Trending Section
    
    func createTrendingSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.75),
                                                                         heightDimension: .fractionalHeight(0.35)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 20,
                                          supplementaryItems: [supplementaryHeaderItem(), supplementaryFooterItem()])
        section.contentInsets = .init(top: 0, leading: 15, bottom: 0, trailing: 10)
        section.supplementariesFollowContentInsets = false
        return section
    }
    
    
    //MARK: - Category Section
    
    func createCategorySection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.4),
                                                                         heightDimension: .fractionalHeight(0.05)),
                                                       subitems: [item])
        group.interItemSpacing = .fixed(5)
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 5,
                                          supplementaryItems: [])
        section.contentInsets = .init(top: 0, leading: 20, bottom: 0, trailing: 10)
        return section
    }
    
    
    //MARK: - Popular Section
    
    func createPopularSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.38),
                                                                         heightDimension: .fractionalHeight(0.4)),
                                                       subitems: [item])
        
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 10,
                                          supplementaryItems: [])
        section.contentInsets = .init(top: 15, leading: 15, bottom: 10, trailing: 10)
        return section
    }
    
    
    //MARK: - Recent Section
    
    func createRecentSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.7),
                                                                         heightDimension: .fractionalHeight(0.32)),
                                                       subitems: [item])
        group.interItemSpacing = .fixed(15)
        let section = createLayoutSection(group: group,
                                          behavior: .continuous,
                                          interGroupSpacing: 15,
                                          supplementaryItems: [supplementaryHeaderItem()])
        section.contentInsets = .init(top: 10, leading: 15, bottom: 10, trailing: 10)
        return section
    }
    
    
    //MARK: - Cuisine Section
    
    func createCuisineSection() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.3),
                                                            heightDimension: .fractionalHeight(1)))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.3)),
                                                       subitems: [item])
        group.interItemSpacing = .fixed(15)
        let section = createLayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 15,
                                          supplementaryItems: [supplementaryHeaderItem()])
        section.contentInsets = .init(top: 10, leading: 15, bottom: 0, trailing: 10)
        return section
    }
    
    
    //MARK: - Setup UI
    
    func configure() {
        collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, _ in
            self.createSectionTypeLayout(section: sectionIndex)
        })
        
        backgroundColor = .none
        bounces = false
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func setDelegates() {
        delegate = self
        dataSource = self
    }
    
    
    func registerCells() {
        register(BRTrendingCollectionViewCell.self, forCellWithReuseIdentifier: BRTrendingCollectionViewCell.identifier)
        register(BRCategoryCollectionViewCell.self, forCellWithReuseIdentifier: BRCategoryCollectionViewCell.identifier)
        register(BRPopularCollectionViewCell.self, forCellWithReuseIdentifier: BRPopularCollectionViewCell.identifier)
        register(BRRecentCollectionViewCell.self, forCellWithReuseIdentifier: BRRecentCollectionViewCell.identifier)
        register(BRCuisineCollectionViewCell.self, forCellWithReuseIdentifier: BRCuisineCollectionViewCell.identifier)
    }
    
    
    func registerHeaderAndFooter() {
        register(BRSeeAllHeader.self,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: BRSeeAllHeader.idHeader)
        register(BRTrendingFooter.self,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                 withReuseIdentifier: BRTrendingFooter.idFooter)
    }
}
