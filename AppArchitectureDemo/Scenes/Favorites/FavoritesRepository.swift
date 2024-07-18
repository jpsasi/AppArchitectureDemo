//
//  FavoritesRepository.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/18/24.
//

class FavoritesRepository {
  
  var dataStore: DataStore
  
  init(dataStore: DataStore = .shared) {
    self.dataStore = dataStore
  }

  func getFavoritesState() -> FavoritesState {
    return dataStore.getFavoritesState()
  }
  
  func setFavoritesState(_ state: FavoritesState) {
    dataStore.setFavoritesState(state)
  }
  
}
