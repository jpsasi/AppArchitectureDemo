//
//  ActivityView.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/17/24.
//

import SwiftUI

struct ActivityView: View {
  let viewModel: ActivityViewModel
  
  var body: some View {
    let _ = Self._printChanges()
    VStack {
      if viewModel.state.activities.isEmpty {
        Text("Activity List is Empty")
      } else {
        List {
          ForEach(viewModel.state.activities) { activity in
            HStack {
              Text(activity.description)
            }
          }
        }
      }
    }
    .onAppear {
      viewModel.loadState()
    }
  }
}

#Preview {
  ActivityView(viewModel: .init(repository: .init()))
}
