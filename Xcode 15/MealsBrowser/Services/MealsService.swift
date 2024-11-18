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
        
//        var urlRequest = URLRequest(url: URL(string: Endpoint.meals.rawValue)!)
//        urlRequest.allHTTPHeaderFields = ["x-api-key": "...", "x-channel-id": "ios"]
//        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let meals = try JSONDecoder().decode(Meals.self, from: data)
        return meals.meals
    }
    
    func fetchMealDetails(_ meal: Meal) async throws -> Meal {
        guard let idMeal = meal.id,
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

class MockMealsService: MealsService {
    var mockMeal: Meal?
    var shouldThrowError = false

    override func fetchMealDetails(_ meal: Meal) async throws -> Meal {
        if shouldThrowError {
            throw URLError(.badServerResponse)
        }
        return mockMeal ?? meal // Return the mock meal or the passed meal if not set.
    }
}
