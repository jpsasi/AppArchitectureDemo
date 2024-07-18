//
//  FavoritesState.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/17/24.
//

import Foundation

struct FavoritesState {
  var favorites: [Int]
  var activities: [ActivityFeed]
  
  init(favorites: [Int], activities: [ActivityFeed]) {
    self.favorites = favorites
    self.activities = activities
  }
}
