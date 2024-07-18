//
//  ContentView.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/17/24.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    let _ = Self._printChanges()
    List {
      NavigationLink("Counter") {
        CounterView(viewModel: CounterViewModel(repository: CounterRepository()))
      }
      NavigationLink("Favorites") {
        FavoritesView(
          viewModel: FavoritesViewModel(repository: FavoritesRepository())
        )
      }
      NavigationLink("Activities") {
        ActivityView(
          viewModel: ActivityViewModel(repository: ActivityRepository())
        )
      }
    }
    .navigationTitle("App Arch Demo")
  }
}

#Preview {
  NavigationStack {
    ContentView()
  }
}
