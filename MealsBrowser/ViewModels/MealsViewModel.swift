//
//  MealsViewModel.swift
//  MealsBrowser
//
//  Created by Etay Luz on 9/11/24.
//

import SwiftUI

@MainActor
class MealsViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    private let MealService = MealsService()
    
    func loadMeals() async {
        do {
            meals = try await MealService.fetchMeals()
        } catch {
            print("Failed to fetch Meals: \(error)")
        }
    }
}
