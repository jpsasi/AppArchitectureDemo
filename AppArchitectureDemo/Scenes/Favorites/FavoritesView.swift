//
//  FavoritesView.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/17/24.
//

import SwiftUI

struct FavoritesView: View {
  let viewModel: FavoritesViewModel
  var body: some View {
    let _ = Self._printChanges()
    VStack {
      if viewModel.state.favorites.isEmpty {
        Text("Favorite List is Empty")
      } else {
        List {
          ForEach(viewModel.state.favorites, id: \.self) { num in
            Text(num.description)
          }
          .onDelete { indexSet in
            viewModel.removeFromFavorites(indexSet)
          }
        }
      }
    }
    .onAppear {
      viewModel.loadState()
    }
    .onDisappear {
      viewModel.setFavoritesState()
    }
  }
}

#Preview {
  FavoritesView(
    viewModel: FavoritesViewModel(repository: .init())
  )
}
