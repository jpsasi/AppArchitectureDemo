//
//  NetworkService.swift
//  AppArchitectureDemo
//
//  Created by Sasikumar JP on 7/18/24.
//

import Foundation

class NetworkService {

  func fetchNumberFact(num: Int) async -> String {
    do {
      let (data, _) = try await URLSession.shared.data(
        from: URL(string: "http://numbersapi.com/\(num)")!)
      let result = String(data: data, encoding: .utf8)
      return result ?? ""
    } catch {
      return "Error: \(error.localizedDescription)"
    }
  }
}
