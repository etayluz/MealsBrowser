//
//  MealsViewModel.swift
//  MealsBrowser
//
//  Created by Etay Luz on 9/11/24.
//

import SwiftUI

@MainActor
class MealViewModel: ObservableObject {
    @Published var meal: Meal
    private let MealService = MealsService()
    
    func fetchMealDetails() async {
        do {
          meal = try await MealService.fetchMealDetails(meal)
//            meall = try await NetworkManager.shared.get(urlString: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
        } catch {
            print("Failed to fetch Meals: \(error)")
        }
    }
    
    init(meal: Meal) {
        self.meal = meal
    }
}
