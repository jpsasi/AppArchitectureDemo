//
//  CounterViewModel.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/17/24.
//

import Foundation
import SwiftUICore

@Observable
class CounterViewModel {
  var state: CounterState
  let repository: CounterRepository
  var factResult: String?
  var showAlert: Binding<Bool> {
    get {
      .init {
        return self.factResult != nil
      } set: { value in
        if value == false {
          self.factResult = nil
        }
      }

    }
  }
  init(repository: CounterRepository) {
    self.state = repository.getCounterState()
    self.repository = repository
  }
  
  func incrementCounter() {
    state.counter += 1
  }
  
  func decrementCounter() {
    state.counter -= 1
  }
  
  func resetCounter() {
    state.counter = 0
  }
  
  func toggleFavorite() {
    if let index = state.favorites.firstIndex(of: state.counter) {
      let num = state.favorites[index]
      state.activities.append(.init(activity: .remove(num), date: .now))
      state.favorites.remove(at: index)
    } else {
      state.activities.append(.init(activity: .add(state.counter), date: .now))
      state.favorites.append(state.counter)
    }
  }
  
  func isFavorite() -> Bool {
    state.favorites.contains { _num in
      _num == state.counter
    }
  }
  
  func loadState() {
    state = repository.getCounterState()
  }
  
  func setState() {
    repository.setCounterState(state)
  }
  
  func fetchNumberFact() {
    Task {
      let result = await repository.fetchNumberFact(num: state.counter)
      Task { @MainActor in
        self.factResult = result
      }
    }
  }
}
