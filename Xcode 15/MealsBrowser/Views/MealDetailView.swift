//
//  MealDetailsView.swift
//  MealsBrowser
//
//  Created by Etay Luz on 9/12/24.
//

import SwiftUI

struct MealDetailView: View {
    @StateObject var viewModel: MealViewModel
    
    var body: some View {
        ScrollView {            
            AsyncImage(url: URL(string: viewModel.meal.strMealThumb ?? "")) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.vertical, 10)
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 100)
            }
            
            Text("Instructions")
                .fontWeight(.bold)
            Text(viewModel.meal.strInstructions ?? "")
                .padding()
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Ingediants")
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Text(viewModel.meal.strIngredient1 ?? "")
                    Text(viewModel.meal.strIngredient2 ?? "")
                    Text(viewModel.meal.strIngredient3 ?? "")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Measurements")
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Text(viewModel.meal.strMeasure1 ?? "")
                    Text(viewModel.meal.strMeasure2 ?? "")
                    Text(viewModel.meal.strMeasure3 ?? "")
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            Spacer()
        }
        .navigationTitle(viewModel.meal.strMeal ?? "")
        .onAppear {
            Task {
                await viewModel.fetchMealDetails()
            }
        }
    }
}


#Preview {
    let meal = Meal(id: "53049",
                    strInstructions: "",
                    strMeal: "Apam balik",
                    strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                    strIngredient1: "",
                    strIngredient2: "",
                    strIngredient3: "",
                    strMeasure1: "",
                    strMeasure2: "",
                    strMeasure3: "")
    return MealDetailView(viewModel: MealViewModel(meal: meal))
}
