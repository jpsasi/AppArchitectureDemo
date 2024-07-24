//
//  CounterRepository.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/18/24.
//

class CounterRepository {
  
  var dataStore: DataStoreProvider
  let networkService: NetworkService
  
  init(
    dataStore: DataStoreProvider = .shared,
    networkService: NetworkService = AppArchDemoNetworkService()
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
