//
//  ClearFlowApp.swift
//  ClearFlow
//
//  Created by Oleksandr on 29.08.2026.
//

import SwiftUI

@main
struct ClearFlowApp: App {
  @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
  
  var body: some Scene {
    WindowGroup {
      if hasSeenOnboarding {
        ContentView()
      } else {
        OnboardingView()
      }
    }
  }
}
