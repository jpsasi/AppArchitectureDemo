//
//  ActivityState.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/17/24.
//

import Foundation

struct ActivityFeed: Identifiable, Hashable, CustomStringConvertible {
  let id = UUID()
  let activity: AcitivityType
  let date: Date
  
  enum AcitivityType: Equatable, Hashable {
    case add(Int)
    case remove(Int)
  }
  
  init(activity: AcitivityType, date: Date) {
    self.activity = activity
    self.date = date
  }
  
  var description: String {
    let description = switch activity {
      case .add(let int):
        "\(int) added in Favorites"
      case .remove(let int):
        "\(int) removed from Favorites"
    }
    return description
  }
}

struct ActivityState {
  var activities: [ActivityFeed]
  
  init(activities: [ActivityFeed] = []) {
    self.activities = activities
  }
}
