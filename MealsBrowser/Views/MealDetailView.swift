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
                    Text(viewModel.meal.strIngredient4 ?? "")
                    Text(viewModel.meal.strIngredient5 ?? "")
                    Text(viewModel.meal.strIngredient6 ?? "")
                    Text(viewModel.meal.strIngredient7 ?? "")
                    Text(viewModel.meal.strIngredient8 ?? "")
                    Text(viewModel.meal.strIngredient9 ?? "")
                    Text(viewModel.meal.strIngredient10 ?? "")
                    Text(viewModel.meal.strIngredient11 ?? "")
                    Text(viewModel.meal.strIngredient12 ?? "")
                    Text(viewModel.meal.strIngredient13 ?? "")
                    Text(viewModel.meal.strIngredient14 ?? "")
                    Text(viewModel.meal.strIngredient15 ?? "")
                    Text(viewModel.meal.strIngredient16 ?? "")
                    Text(viewModel.meal.strIngredient17 ?? "")
                    Text(viewModel.meal.strIngredient18 ?? "")
                    Text(viewModel.meal.strIngredient19 ?? "")
                    Text(viewModel.meal.strIngredient20 ?? "")
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Measurements")
                        .fontWeight(.bold)
                        .padding(.bottom)
                    Text(viewModel.meal.strMeasure1 ?? "")
                    Text(viewModel.meal.strMeasure2 ?? "")
                    Text(viewModel.meal.strMeasure3 ?? "")
                    Text(viewModel.meal.strMeasure4 ?? "")
                    Text(viewModel.meal.strMeasure5 ?? "")
                    Text(viewModel.meal.strMeasure6 ?? "")
                    Text(viewModel.meal.strMeasure7 ?? "")
                    Text(viewModel.meal.strMeasure8 ?? "")
                    Text(viewModel.meal.strMeasure9 ?? "")
                    Text(viewModel.meal.strMeasure10 ?? "")
                    Text(viewModel.meal.strMeasure11 ?? "")
                    Text(viewModel.meal.strMeasure12 ?? "")
                    Text(viewModel.meal.strMeasure13 ?? "")
                    Text(viewModel.meal.strMeasure14 ?? "")
                    Text(viewModel.meal.strMeasure15 ?? "")
                    Text(viewModel.meal.strMeasure16 ?? "")
                    Text(viewModel.meal.strMeasure17 ?? "")
                    Text(viewModel.meal.strMeasure18 ?? "")
                    Text(viewModel.meal.strMeasure19 ?? "")
                    Text(viewModel.meal.strMeasure20 ?? "")
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
    let meal = Meal(idMeal: "53049",
                    strInstructions: "",
                    strMeal: "Apam balik",
                    strMealThumb: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
                    strIngredient1: "",
                    strIngredient2: "",
                    strIngredient3: "",
                    strIngredient4: "",
                    strIngredient5: "",
                    strMeasure1: "",
                    strMeasure2: "",
                    strMeasure3: "",
                    strMeasure4: "",
                    strMeasure5: "",
                    strMeasure6: "")
    return MealDetailView(viewModel: MealViewModel(meal: meal))
}
