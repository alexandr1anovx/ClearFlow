//
//  OnboardingView.swift
//  ClearFlow
//
//  Created by Oleksandr on 29.08.2026.
//

import SwiftUI
import Lottie

struct OnboardingView: View {
  @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
  @State private var viewModel = OnboardingViewModel()
  @State private var isSkipButtonClear = false
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        Button("Пропустити") {
          finishOnboarding()
        }
        .font(.callout)
        .foregroundColor(isSkipButtonClear ? .primary : .clear)
        .padding()
        .opacity(viewModel.isLastPage ? 0 : 1)
        .onAppear {
          withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            isSkipButtonClear.toggle()
          }
        }
      }
      
      TabView(selection: $viewModel.currentPage) {
        ForEach(0..<viewModel.pages.count, id: \.self) { index in
          OnboardingPageView(page: viewModel.pages[index])
            .tag(index)
        }
      }
      .tabViewStyle(.page(indexDisplayMode: .always))
      .indexViewStyle(.page(backgroundDisplayMode: .always))
      
      Button {
        if viewModel.isLastPage {
          finishOnboarding()
        } else {
          viewModel.nextButtonTapped()
        }
      } label: {
        Text(viewModel.isLastPage ? "Почати роботу" : "Далі")
          .font(.headline)
          .foregroundColor(Color(.systemBackground))
          .frame(maxWidth: .infinity)
          .padding()
          .background(Color.primary)
          .clipShape(.capsule)
      }
      .padding(.horizontal, 24)
      .padding(.bottom, 20)
    }
  }
  
  private func finishOnboarding() {
    withAnimation {
      hasSeenOnboarding = true
    }
  }
}

// MARK: - Onboarding Page View

struct OnboardingPageView: View {
  let page: OnboardingPage
  
  var body: some View {
    VStack(spacing: 25) {
      Spacer()
      
      LottieView(animation: .named(page.animationName))
        .animationSpeed(0.7)
        .playing(loopMode: .autoReverse)
        .resizable()
        .scaledToFit()
        .frame(height: 200)
      
      VStack(spacing: 15) {
        Text(page.title)
          .font(.system(size: 28, weight: .bold))
          .multilineTextAlignment(.center)
        
        Text(page.description)
          .font(.callout)
          .foregroundColor(.secondary)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 30)
      }
      Spacer()
    }
  }
}

#Preview {
  OnboardingView()
}
