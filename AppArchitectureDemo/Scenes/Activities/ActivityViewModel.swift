//
//  ActivityViewModel.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/17/24.
//

import Foundation

@Observable
class ActivityViewModel {
  var state: ActivityState
  let repository: ActivityRepository
  
  init(repository: ActivityRepository) {
    self.state = repository.getActivityState()
    self.repository = repository
  }
  
  func loadState() {
    state = repository.getActivityState()
  }
  
  func setActivityState() {
    repository.setActivityState(state)
  }
}
