//
//  StepChartView.swift
//  WalkMyWay
//
//  Created by Thomas Cowern on 10/29/23.
//

import SwiftUI
import Charts

struct StepChartView: View {
    
    let steps: [Step]
    
    var body: some View {
        Chart {
            ForEach(steps) { step in
                BarMark(x: .value("Date", step.date), y: .value("Steps", step.count))
                    .foregroundStyle(isUnder5000(step.count) ? .red : .green)
            }
        }
        .padding()
    }
}

#Preview {
    StepChartView(steps: [Step(count: 1234, date: Date())])
}
