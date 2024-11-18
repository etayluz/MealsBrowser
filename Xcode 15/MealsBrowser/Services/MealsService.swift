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
        var components = URLComponents()
        components.scheme = "https"
        components.host = "themealdb.com"
        components.path = "/api/json/v1/1/filter.php"
        components.queryItems = [
            URLQueryItem(name: "c", value: "Dessert"),
            //                URLQueryItem(name: "sort", value: sorting.rawValue)
        ]
        
        // Getting a URL from our components is as simple as
        // accessing the 'url' property.
        print(components.url)
        guard let url = components.url else {
//        guard let url = URL(string: Endpoint.meals.rawValue) else {
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
