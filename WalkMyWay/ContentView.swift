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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello")
        }
        .task {
            await healthStore.requestAuthorization()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
