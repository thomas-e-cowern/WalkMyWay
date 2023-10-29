//
//  ContentView.swift
//  WalkMyWay
//
//  Created by Thomas Cowern on 10/29/23.
//

import SwiftUI

enum DisplayType: Int, Identifiable, CaseIterable {
    case list
    case chart
    
    var id: Int {
        rawValue
    }
}

extension DisplayType {
    var icon: String {
        switch self {
        case .list:
            return "list.bullet"
        case .chart:
            return "chart.bar"
        }
    }
}


struct ContentView: View {
    
    @State private var healthStore = HealthStore()
    
    private var steps: [Step] {
        healthStore.steps.sorted { lhs, rhs in
            lhs.date > rhs.date
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if let step = steps.first {
                    TodayStepView(step: step)
                }
                StepListView(steps: Array(steps.dropFirst()))
            }
            .task {
                await healthStore.requestAuthorization()
                do {
                    try await healthStore.calculateSteps()
                } catch {
                    print(error.localizedDescription)
                }
            }
            .padding()
        .navigationTitle("Walk My Way")
        }
    }
}

#Preview {
    ContentView()
}
