//
//  MealsView.swift
//  MealsBrowser
//
//  Created by Etay Luz on 9/12/24.
//

import SwiftUI
import MapKit

struct MealsView: View {
    @StateObject private var viewModel = MealsViewModel()
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Example coordinates for San Francisco
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    var body: some View {
//        MapView()
        NavigationStack {
//            ScrollView {
//                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
//                    ForEach(viewModel.meals) { meal in
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
//List {
//    Section(header: Text("RESULTS")) {
//        ForEach(viewModel.results.Results) { result in
//            VStack(alignment: .leading) {
//                Text(result.Text ?? "").font(.body)
//                Text(result.FirstURL ?? "").font(.subheadline)
//            }
//        }
//    }
//    Section(header: Text("RELATED TOPICS")) {
//        ForEach(viewModel.results.RelatedTopics) { relatedTopic in
//            VStack(alignment: .leading) {
//                Text(relatedTopic.Text ?? "").font(.body)
//                Text(relatedTopic.FirstURL ?? "").font(.subheadline)
//            }
//        }
//    }
//}


#Preview {
    MealsView()
}
