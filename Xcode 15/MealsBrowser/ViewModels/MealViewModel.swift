//
//  MealsViewModel.swift
//  MealsBrowser
//
//  Created by Etay Luz on 9/11/24.
//

import SwiftUI

//@MainActor
class MealViewModel: ObservableObject {
    @Published var meal: Meal
    var mealService = MealsService()
    
    func fetchMealDetails() async {
        do {
          meal = try await mealService.fetchMealDetails(meal)
//            meall = try await NetworkManager.shared.get(urlString: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        } catch {
            print("Failed to fetch Meals: \(error)")
        }
    }
    
    init(meal: Meal) {
        self.meal = meal
    }
}
