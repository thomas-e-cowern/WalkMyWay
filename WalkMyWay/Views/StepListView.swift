//
//  StepListView.swift
//  WalkMyWay
//
//  Created by Thomas Cowern on 10/29/23.
//

import SwiftUI

struct StepListView: View {
    
    let steps: [Step]
    
    var body: some View {
        List(steps) { step in
            HStack {
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundStyle()
                Text("\(step.count)")
                Spacer()
                Text(step.date?.formatted(date: .abbreviated, time: .omitted))
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    StepListView(steps: [])
}
