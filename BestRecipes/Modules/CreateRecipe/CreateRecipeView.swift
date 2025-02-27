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
    
    //MARK: - Private properties
    private var ingredientCount = 1
    
    private let pickerView = UIPickerView()
    private var servesesVariants = (1...10).map { $0 }
    
    private lazy var tableView = makeTableView()
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isHidden = true
        pickerView.backgroundColor = .white
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        setViews()
        setupConstrains()
        setupTargetAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
        setupConstrains()
        setupTargetAction()
    }
    
    private func makeTableView() -> UITableView {
        let table = UITableView()
        table.backgroundColor = .none
        table.separatorStyle = .none
        table.bounces = false
        table.showsVerticalScrollIndicator = false
        table.dataSource = self
        table.delegate = self
        table.register(
            CreateRecipeImageCell.self,
            forCellReuseIdentifier: CreateRecipeImageCell.identifier
        )
        table.register(
            CreateRecipeTitleCell.self,
            forCellReuseIdentifier: CreateRecipeTitleCell.identifier
        )
        table.register(
            CreateRecipeIngredientCell.self,
            forCellReuseIdentifier: CreateRecipeIngredientCell.identifier
        )
        table.register(
            CreateRecipeServesesCell.self,
            forCellReuseIdentifier: CreateRecipeServesesCell.identifier
        )
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }
}

//MARK: - Selectors
private extension CreateRecipeView {
    @objc func createRecipeButtonClicked() {
        delegate?.createRecipeButtonPressed()
    }
}

//MARK: - Setup UI
private extension CreateRecipeView {
    func setViews() {
        addSubviews(
            tableView,
            createRecipeButtom,
            pickerView
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
            createRecipeButtom.heightAnchor.constraint(equalToConstant: 56),
            
            pickerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            pickerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

// MARK: - TableViewDataSource
extension CreateRecipeView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 { return UIView() }
        
        let header = UIView()
        let label = UILabel()
        label.text = "Ingredients"
        label.font = Font.getFont(.poppinsSemiBold, size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        header.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: header.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: header.centerYAnchor)
        ])
        
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 4 : ingredientCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: CreateRecipeImageCell.identifier,
                    for: indexPath
                ) as? CreateRecipeImageCell else { return UITableViewCell() }
                cell.cellIndexPath = indexPath
                cell.delegate = self
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: CreateRecipeTitleCell.identifier,
                    for: indexPath
                ) as? CreateRecipeTitleCell else { return UITableViewCell() }
                cell.cellIndexPath = indexPath
                cell.delegate = self
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: CreateRecipeServesesCell.identifier,
                    for: indexPath
                ) as? CreateRecipeServesesCell else { return UITableViewCell() }
                cell.cellIndexPath = indexPath
                cell.delegate = self
                return cell
            case 3:
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: CreateRecipeServesesCell.identifier,
                    for: indexPath
                ) as? CreateRecipeServesesCell else { return UITableViewCell() }
                cell.cellIndexPath = indexPath
                cell.cellLabel.text = "Cook time"
                cell.cellImageView.image = UIImage(named: "Clock")
                cell.servesCount.text = "15 min"
                cell.delegate = self
                return cell
            default:
                return UITableViewCell()
            }
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: CreateRecipeIngredientCell.identifier,
                for: indexPath
            ) as? CreateRecipeIngredientCell else { return UITableViewCell() }
            cell.cellIndexPath = indexPath
            cell.delegate = self
            return cell
        }
    }
}

// MARK: - TableViewDelegate
extension CreateRecipeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                200 + 16
            case 1:
                45 + 16
            default:
                60 + 16
            }
        } else {
            45 + 16
        }
    }
}

//MARK: - CreateRecipeTitleCellDelegate
extension CreateRecipeView: CreateRecipeImageCellDelegate {
    func didTapImageButton(_ indexPath: IndexPath?, _ plusButton: Bool) {
        print("didTapImageButton")
    }
}

//MARK: - CreateRecipeTitleCellDelegate
extension CreateRecipeView: CreateRecipeTitleCellDelegate {
    func didTapTitleButton(_ indexPath: IndexPath?) {
        print("didTapTitleButton")
    }
}

//MARK: - CreateRecipeIngredientCellDelegate
extension CreateRecipeView: CreateRecipeServesesCellDelegate {
    func didTapServesesButton(_ indexPath: IndexPath?) {
        print("didTapServesesButton")
        pickerView.isHidden.toggle()
    }
}

//MARK: - CreateRecipeIngredientCellDelegate
extension CreateRecipeView: CreateRecipeIngredientCellDelegate {
    func didTapButton(_ indexPath: IndexPath?, _ plusButton: Bool) {
        guard let targetSection = indexPath?.section,
              let targetRow = indexPath?.row else { return }
        if plusButton {
            ingredientCount += 1
            tableView.insertRows(at: [[targetSection, targetRow + 1]], with: .automatic)
        } else {
            ingredientCount -= 1
            tableView.deleteRows(at: [[targetSection, targetRow]], with: .automatic)
        }
        
        updateIndexses()
    }
}

//MARK: - Picker functionality
extension CreateRecipeView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        servesesVariants.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(servesesVariants[row])
    }
}


extension CreateRecipeView {
    func updateIndexses() {
        for row in 0..<tableView.numberOfRows(inSection: 1) {
            let indexPath = IndexPath(row: row, section: 1)
            if let cell = tableView.cellForRow(at: indexPath) {
                guard let customCell = cell as? CreateRecipeIngredientCell else { return }
                customCell.cellIndexPath = [1, row]
            }
        }
    }
}








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
