//
//  DetailTextView.swift
//  BestRecipes
//
//  Created by Pavel Kostin on 04.07.2024.
//

import UIKit

final class DetailText: UIView {
    
    private let textInstruction = APIModel(instruction: [
        
        Instruction(number: 1, step: "Place eggs in a saucepan and cover with cold water. Bring water to a boil and immediately remove from heat. Cover and let eggs stand in hot water for 10 to 12 minutes. Remove from hot water, cool, peel, and chop."),
        Instruction(number: 2, step: "Place chopped eggs in a bowl."),
        Instruction(number: 3, step: "Add chopped tomatoes, corns, lettuce, and any other vegitable of your choice."),
        Instruction(number: 4, step: "Stir in mayonnaise, green onion, and mustard. Season with paprika, salt, and pepper.")
    ],
                                           redText: "Stir and serve on your favorite bread or crackers.")
    
    private let verticalStack = UIStackView()
    private let instructionLabel = UILabel()
    private let textView = UITextView()
    private let redText = UILabel()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
        setupConstraint()
        setupConfigure()
        updateInstructionText()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}


private extension DetailText {
    
    func setupView() {
        addSubviews(verticalStack)
        verticalStack.addArrangedSubviews([instructionLabel, textView, redText])
    }
    
    func setupConstraint() {
        
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            verticalStack.topAnchor.constraint(equalTo: topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    func setupConfigure() {
        
        verticalStack.axis = .vertical
        verticalStack.spacing = 6
        
        instructionLabel.text = "Instructions"
        instructionLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        
        textView.font = .systemFont(ofSize: 18, weight: .medium)
        textView.isEditable = false
        textView.isSelectable = false
        textView.isScrollEnabled = false
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        
        redText.font = .systemFont(ofSize: 18, weight: .medium)
        redText.textColor = #colorLiteral(red: 0.9137254902, green: 0.2705882353, blue: 0.3647058824, alpha: 1)
        redText.numberOfLines = 0
    }
}

private extension DetailText {
    
    func updateInstructionText() {
        
        DispatchQueue.main.async {
            let instructions = self.textInstruction.instruction.map { " \($0.number). \($0.step)" }
            self.textView.text = instructions.joined(separator: "/n")
            self.redText.text = self.textInstruction.redText
        }
    }
}

