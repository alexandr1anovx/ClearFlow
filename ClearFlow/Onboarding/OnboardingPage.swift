//
//  OnboardingPage.swift
//  ClearFlow
//
//  Created by Oleksandr on 29.08.2026.
//

import Foundation

struct OnboardingPage: Identifiable {
  let id = UUID()
  let title: String
  let description: String
  let animationName: String // Lottie JSON file name
}
