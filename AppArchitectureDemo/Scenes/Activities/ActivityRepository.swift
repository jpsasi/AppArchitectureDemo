//
//  ActivityRepository.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/18/24.
//

class ActivityRepository {
  var dataStore: DataStoreProvider
  
  init(dataStore: DataStoreProvider = .shared) {
    self.dataStore = dataStore
  }

  func getActivityState() -> ActivityState {
    dataStore.getActivityState()
  }
  
  func setActivityState(_ state: ActivityState) {
    dataStore.setActivityState(state)
  }

}
