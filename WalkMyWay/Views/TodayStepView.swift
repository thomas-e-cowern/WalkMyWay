//
//  TodayStepView.swift
//  WalkMyWay
//
//  Created by Thomas Cowern on 10/29/23.
//

import SwiftUI

struct TodayStepView: View {
    
    let step: Step
    
    var body: some View {
        VStack {
            Text("\(step.count)")
                .font(.largeTitle)
        }
        .frame(maxWidth: .infinity, maxHeight: 150)
        .background(.orange)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(alignment: .topLeading) {
            HStack {
                Image(systemName: "flame")
                Text("Steps")
            }
            .foregroundColor(.red)
            .padding()
        }
        .overlay(alignment: .bottomTrailing) {
            Text(step.date.formatted(date: .abbreviated, time: .omitted))
                .font(.caption)
                .padding()
        }
    }
}

#Preview {
    TodayStepView(step: Step(count: 2341, date: Date()))
}
