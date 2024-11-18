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
    //var id = NSUUID().uuidString - use this if there is NO id anywhere
    let strInstructions: String?
    let strMeal: String?
    let strMealThumb: String?
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    
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
