//
//  DataStore.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/17/24.
//

import Foundation

struct DataStore {
  public private(set) var counter: Int
  public private(set) var favorites: [Int]
  public private(set) var activities: [ActivityFeed]

  static var shared: DataStore = .init()
  static func testDataStore(
    counter: Int,
    favorites: [Int],
    activities: [ActivityFeed]
  ) -> Self {
    return Self.init(counter: counter, favorites: favorites, activities: activities)
  }
  
  private init(
    counter: Int = 0,
    favorites: [Int] = [],
    activities:[ActivityFeed] = []
  ) {
    self.counter = counter
    self.favorites = favorites
    self.activities = activities
  }

  func getCounterState() -> CounterState {
    return CounterState(
      counter: counter,
      favorites: favorites,
      activities: activities
    )
  }
  
  mutating func setCounterState(_ state: CounterState) {
    self.counter = state.counter
    self.favorites = state.favorites
    self.activities = state.activities
  }
  
  func getFavoritesState() -> FavoritesState {
    return .init(favorites: favorites, activities: activities)
  }
  
  mutating func setFavoritesState(_ state: FavoritesState) {
    self.favorites = state.favorites
    self.activities = state.activities
  }
  
  func getActivityState() -> ActivityState {
    return .init(activities: activities)
  }
  
  mutating func setActivityState(_ state: ActivityState) {
    activities = state.activities
  }
}
