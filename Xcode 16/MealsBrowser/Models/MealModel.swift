//
//  MealModel.swift
//  MealsBrowser
//
//  Created by Etay Luz on 9/12/24.
//

import Foundation

struct Meals: Decodable {
    let meals: [Meal]
}

struct Meal: Identifiable, Decodable {
//    var id = UUID()
    let idMeal: String?
    let strInstructions: String?
    let strMeal: String?
    let strMealThumb: String?
    
    var strIngredient1: String? = ""
    var strIngredient2: String? = ""
    var strIngredient3: String? = ""
    
    var strMeasure1: String? = ""
    var strMeasure2: String? = ""
    var strMeasure3: String? = ""
    
    var id: Int {
        Int.random(in: 1...1000000000)
    }
}
