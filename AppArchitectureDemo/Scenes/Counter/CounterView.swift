//
//  CounterView.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/17/24.
//

import SwiftUI

struct CounterView: View {
  let viewModel: CounterViewModel
  
  var body: some View {
    let _ = Self._printChanges()
    VStack {
      HStack {
        button(with: "minus") {
          viewModel.handleAction(.decrementButtonTapped)
        }
        Text(viewModel.state.counter.description)
          .font(.title)
        button(with: "plus") {
          viewModel.handleAction(.incrementButtonTapped)
        }
      }
      Button {
        viewModel.handleAction(.toggleFavoriteButtonTapped)
      } label: {
        Image(systemName: viewModel.isFavorite() ? "heart.fill" : "heart")
          .font(.title)
      }
      Button("Number Fact") {
        viewModel.handleAction(.fetchNumberFact)
      }
      .font(.title)
    }
    .alert("Number Fact", isPresented: viewModel.showAlert, actions: {
      Text("\(viewModel.factResult ?? "")")
        .font(.caption)
        .lineLimit(3)
      Button("Ok") {}
    })
    .padding()
    .onAppear {
      viewModel.loadState()
    }
    .onDisappear {
      viewModel.setState()
    }
  }
  
  func button(with systemImage: String, action: @escaping () -> Void) -> some View {
    Button {
      action()
    } label: {
      Image(systemName: systemImage)
        .foregroundColor(.white)
        .padding()
        .frame(height: 40.0)
        .frame(width: 100.0)
        .background(.blue)
        .clipShape(Capsule())
    }
  }
}

#Preview {
  CounterView(viewModel: CounterViewModel(repository: .init()))
}
