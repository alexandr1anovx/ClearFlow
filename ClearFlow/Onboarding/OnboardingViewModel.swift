//
//  OnboardingViewModel.swift
//  ClearFlow
//
//  Created by Oleksandr on 29.08.2026.
//

import SwiftUI

@Observable
final class OnboardingViewModel {
  
  var pages: [OnboardingPage] = [
    OnboardingPage(
      title: "Контролюй фінанси",
      description: "ClearFlow допоможе тобі легко відстежувати доходи та витрати без зайвих дій.",
      animationName: "coins"
    ),
    OnboardingPage(
      title: "Аналізуй витрати",
      description: "Зрозумілі графіки та статистика покажуть, куди йдуть твої гроші.",
      animationName: "bar-chart"
    ),
    OnboardingPage(
      title: "Досягай цілей",
      description: "Став фінансові цілі та впевнено йди до них щодня.",
      animationName: "piggy-bank"
    )
  ]
  
  var currentPage = 0
  
  func nextButtonTapped() {
    if currentPage < pages.count - 1 {
      withAnimation {
        currentPage += 1
      }
    }
  }
  
  var isLastPage: Bool {
    currentPage == pages.count - 1
  }
}
