//
//  MealsService.swift
//  MealsBrowser
//
//  Created by Etay Luz on 9/12/24.
//

import Foundation

class MealsService {
    
    enum Endpoint: String {
        case meals = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"
        case mealDetails = "https://themealdb.com/api/json/v1/1/lookup.php?i="
    }

    func fetchMeals() async throws -> [Meal] {
        guard let url = URL(string: Endpoint.meals.rawValue) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let meals = try JSONDecoder().decode(Meals.self, from: data)
        return meals.meals
    }
    
    func fetchMealDetails(_ meal: Meal) async throws -> Meal {
        guard let idMeal = meal.idMeal,
              let url = URL(string: "\(Endpoint.mealDetails.rawValue)\(idMeal)") else {
            throw URLError(.badURL)
        }
        print(url)
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let meals = try JSONDecoder().decode(Meals.self, from: data)
        guard let meal = meals.meals.first else {
            throw URLError(.badServerResponse)
        }
        return meal
    }
}
