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
    let id: String?
    let strInstructions: String?
    let strMeal: String?
    let strMealThumb: String?
    
    var strIngredient1: String? = ""
    var strIngredient2: String? = ""
    var strIngredient3: String? = ""
    
    var strMeasure1: String? = ""
    var strMeasure2: String? = ""
    var strMeasure3: String? = ""
    
    // Map "titleId" from JSON to "id" in the model
    private enum CodingKeys: String, CodingKey {
            case id = "idMeal"
            case strInstructions
            case strMeal
            case strMealThumb
            case strIngredient1
            case strIngredient2
            case strIngredient3
            case strMeasure1
            case strMeasure2
            case strMeasure3
        }
}
