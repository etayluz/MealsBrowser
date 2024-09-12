//
//  MealsView.swift
//  MealsBrowser
//
//  Created by Etay Luz on 9/12/24.
//

import SwiftUI

struct MealsView: View {
    @StateObject private var viewModel = MealsViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.meals) { meal in
                NavigationLink(destination: MealDetailView(viewModel: MealViewModel(meal: meal))) {
                    HStack {
                        AsyncImage(url: URL(string: meal.strMealThumb ?? "")) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 100, height: 100)
                        }
                        VStack(alignment: .leading) {
                            Text(meal.strMeal ?? "")
                                .font(.subheadline)
                                .lineLimit(2)
                        }
                    }
                }
            }
            .navigationTitle("Meals")
            .onAppear {
                Task {
                    await viewModel.loadMeals()
                }
            }
        }
    }
}


#Preview {
    MealsView()
}
