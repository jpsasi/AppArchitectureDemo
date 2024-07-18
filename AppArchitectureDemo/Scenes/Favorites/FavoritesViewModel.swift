//
//  FavoritesViewModel.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/17/24.
//

import Foundation

@Observable
class FavoritesViewModel {
  var state: FavoritesState
  let repository: FavoritesRepository
  
  init(repository: FavoritesRepository) {
    self.state = repository.getFavoritesState()
    self.repository = repository
  }
  
  func removeFromFavorites(_ indexSet: IndexSet) {
    for index in indexSet {
      let value = state.favorites[index]
      state.activities.append(.init(activity: .remove(value), date: .now))
    }
    state.favorites.remove(atOffsets: indexSet)
  }

  func loadState() {
    state = repository.getFavoritesState()
  }
  
  func setFavoritesState() {
    repository.setFavoritesState(state)
  }
}
