//
//  OBModel.swift
//  BestRecipes
//
//  Created by Drolllted on 07.07.2024.
//

import Foundation


struct OBModel{
    let title: String
    let backgroundImage: String
    
    static let modelOB: [OBModel] = [
        OBModel(title: "Recipes from all over the World", backgroundImage: "firstOnboarding"),
        OBModel(title: "Recipes with each and every detail", backgroundImage: "secondOnboarding"),
        OBModel(title: "Cook it now or save it for later", backgroundImage: "thirdOnboarding")
    ]
}

