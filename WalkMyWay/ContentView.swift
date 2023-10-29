//
//  ContentView.swift
//  WalkMyWay
//
//  Created by Thomas Cowern on 10/29/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var healthStore = HealthStore()
    
    var body: some View {
        List(healthStore.steps) { step in
            
            Text("\(step.count)")
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
    }
}

#Preview {
    ContentView()
}
