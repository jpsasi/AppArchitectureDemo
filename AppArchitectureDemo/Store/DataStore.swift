//
//  DataStore.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/17/24.
//

import Foundation

class DataStoreProvider {
  
  struct DataStore {
    var counter: Int
    var favorites: [Int]
    var activities: [ActivityFeed]
    
    init(counter: Int = 0, favorites: [Int] = [], activities: [ActivityFeed] = []) {
      self.counter = counter
      self.favorites = favorites
      self.activities = activities
    }
  }
  private var dataStore: DataStore = DataStore()
  
  private init() {}
  static var shared = DataStoreProvider()
  static func initializeDataStore(
    counter: Int,
    favorites: [Int],
    activities: [ActivityFeed]
  ) -> DataStoreProvider {
    let provider = DataStoreProvider()
    provider.dataStore.counter = counter
    provider.dataStore.favorites = favorites
    provider.dataStore.activities = activities
    return provider
  }
  
  func getCounterState() -> CounterState {
    return CounterState(
      counter: dataStore.counter,
      favorites: dataStore.favorites,
      activities: dataStore.activities
    )
  }
  
  func setCounterState(_ state: CounterState) {
    dataStore.counter = state.counter
    dataStore.favorites = state.favorites
    dataStore.activities = state.activities
  }

  func getFavoritesState() -> FavoritesState {
    return .init(favorites: dataStore.favorites,
                 activities: dataStore.activities)
  }
  
  func setFavoritesState(_ state: FavoritesState) {
    dataStore.favorites = state.favorites
    dataStore.activities = state.activities
  }
  
  func getActivityState() -> ActivityState {
    return .init(activities: dataStore.activities)
  }
  
  func setActivityState(_ state: ActivityState) {
    dataStore.activities = state.activities
  }
}
