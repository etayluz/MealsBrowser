//
//  MealsBrowserTests.swift
//  MealsBrowserTests
//
//  Created by Etay Luz on 11/17/24.
//

import XCTest
@testable import MealsBrowser

final class MealsBrowserTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFetchMealDetails_Success() async throws {
            // Arrange: Set up the mock meal and the ViewModel.
        let mockMeal = Meal(id: "1", strInstructions: "Cook", strMeal: "1", strMealThumb: "1", strIngredient1: "1", strIngredient2: "1", strIngredient3: "1", strMeasure1: "1", strMeasure2: "1", strMeasure3: "1")
        let mockService = MockMealsService()
        mockService.mockMeal = mockMeal
        
        let viewModel = MealViewModel(meal: mockMeal)
        viewModel.mealService = mockService // Set the mock service.
        
        // Act: Call the fetchMealDetails function.
        await viewModel.fetchMealDetails()
        
        // Assert: Verify that the meal property is updated correctly.
        XCTAssertEqual(viewModel.meal.strInstructions, mockMeal.strInstructions)
        XCTAssertEqual(viewModel.meal.strMeal, mockMeal.strMeal)
    }

}
