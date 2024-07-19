//
//  CounterViewModelTests.swift
//  AppArchitectureDemoTests
//
//  Created by Sasikumar JP on 7/18/24.
//

import Testing
@testable import AppArchitectureDemo

struct CounterViewModelTests {
  
  @Test func incrementCounter() async throws {
    let dataStore = DataStore.testDataStore(
      counter: 100,
      favorites: [],
      activities: []
    )
    let viewModel = CounterViewModel(
      repository: CounterRepository(dataStore: dataStore)
    )
    
    viewModel.handleAction(.incrementButtonTapped)
    #expect(viewModel.state.counter == 101)
    viewModel.handleAction(.incrementButtonTapped)
    #expect(viewModel.state.counter == 102)
  }
  
  @Test func decrementCounter() async throws {
    let dataStore = DataStore.testDataStore(
      counter: 100,
      favorites: [],
      activities: []
    )
    let viewModel = CounterViewModel(
      repository: CounterRepository(dataStore: dataStore)
    )
    
    viewModel.handleAction(.decrementButtonTapped)
    #expect(viewModel.state.counter == 99)
    viewModel.handleAction(.decrementButtonTapped)
    #expect(viewModel.state.counter == 98)
  }

  @Test func incrementAndDecrementCounter() async throws {
    let dataStore = DataStore.testDataStore(
      counter: 100,
      favorites: [],
      activities: []
    )
    let viewModel = CounterViewModel(
      repository: CounterRepository(dataStore: dataStore)
    )
    
    viewModel.handleAction(.decrementButtonTapped)
    #expect(viewModel.state.counter == 99)
    viewModel.handleAction(.incrementButtonTapped)
    #expect(viewModel.state.counter == 100)
  }

  @Test func toggleFavorite() async throws {
    let dataStore = DataStore.testDataStore(
      counter: 2,
      favorites: [1,2,3],
      activities: []
    )
    let viewModel = CounterViewModel(
      repository: CounterRepository(dataStore: dataStore)
    )

    viewModel.handleAction(.toggleFavoriteButtonTapped)
    #expect(viewModel.state.favorites == [1,3])
    viewModel.handleAction(.toggleFavoriteButtonTapped)
    #expect(viewModel.state.favorites == [1,3,2])
  }
  
  @Test func fetchNumberFact() async throws {
    
    class MockNetworkService: NetworkService {
      func fetchNumberFact(num: Int) async -> String {
        return "\(num) is a good number"
      }
    }
    let networkService = MockNetworkService()
    let dataStore = DataStore.testDataStore(
      counter: 100,
      favorites: [],
      activities: []
    )
    let viewModel = CounterViewModel(
      repository: CounterRepository(
        dataStore: dataStore,
        networkService: networkService
      )
    )

    try await viewModel.fetchNumberFact()
    #expect(viewModel.factResult == "100 is a good number")
  }
}
