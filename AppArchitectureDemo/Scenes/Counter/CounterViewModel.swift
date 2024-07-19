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
  public private(set) var state: CounterState
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
  
  func handleAction(_ action: CounterAction) {
    switch action {
      case .incrementButtonTapped:
        incrementCounter()
      case .decrementButtonTapped:
        decrementCounter()
      case .fetchNumberFact:
        Task {
          try await fetchNumberFact()
        }
      case .fetchedNumberFact(let string):
        self.factResult = string
      case .toggleFavoriteButtonTapped:
        toggleFavorite()
    }
  }
  
  private func incrementCounter() {
    state.counter += 1
  }
  
  private func decrementCounter() {
    state.counter -= 1
  }
  
  private func resetCounter() {
    state.counter = 0
  }
  
  private func toggleFavorite() {
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
  
  func fetchNumberFact() async throws {
    let result = await repository.fetchNumberFact(num: state.counter)
    self.factResult = result
  }
}
