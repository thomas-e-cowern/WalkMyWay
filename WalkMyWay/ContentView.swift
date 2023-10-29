//
//  ContentView.swift
//  WalkMyWay
//
//  Created by Thomas Cowern on 10/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var healthStore = HealthStore()
    
    private var steps: [Step] {
        healthStore.steps.sorted { lhs, rhs in
            lhs.date > rhs.date
        }
    }
    
    var body: some View {
        StepListView(steps: steps)
        .task {
            await healthStore.requestAuthorization()
            do {
                try await healthStore.calculateSteps()
            } catch {
                print(error.localizedDescription)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
