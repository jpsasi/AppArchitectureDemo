//
//  CounterState.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/17/24.
//

import Foundation

struct CounterState {
  var counter: Int
  var favorites: [Int]
  var activities: [ActivityFeed]
  
  init(counter: Int = 0, favorites: [Int] = [], activities: [ActivityFeed] = []) {
    self.counter = counter
    self.favorites = favorites
    self.activities = activities
  }
}
