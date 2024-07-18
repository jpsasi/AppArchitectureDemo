//
//  CounterRepository.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/18/24.
//

class CounterRepository {
  
  var dataStore: DataStore
  let networkService: NetworkService
  
  init(
    dataStore: DataStore = .shared,
    networkService: NetworkService = .init()
  ) {
    self.dataStore = dataStore
    self.networkService = networkService
  }

  func getCounterState() -> CounterState {
    return dataStore.getCounterState()
  }

  func setCounterState(_ state: CounterState) {
    dataStore.setCounterState(state)
  }

  func fetchNumberFact(num: Int) async -> String {
    return await networkService.fetchNumberFact(num: num)
  }
}
