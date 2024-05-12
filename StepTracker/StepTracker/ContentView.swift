//
//  ContentView.swift
//  StepTracker
//
//  Created by Briana Bayne on 5/11/24.
//

import SwiftUI

/// CaseIterable - allows to run through all cases like an array
/// Identifiable - For each


// MARK: - Enum

enum HealthMetricContext: CaseIterable, Identifiable {
    case steps, weight
    /// Self = the HealthMetricContext
    var id: Self { return self }
    
    var title: String {
        switch self {
        case .steps:
            return "Steps"
        case .weight:
            return "Weight"
        }
    }
}


struct ContentView: View {
    
    // MARK: - Properties
    
    @State private var selectedStat: HealthMetricContext = .steps
    
    // MARK: - Computed Property
    
    var isSteps: Bool {
        selectedStat == .steps
    }
    var body: some View {
        /// Navigation Stack - View that displays a root view and enables you to present additional views over the root view.
        NavigationStack {
            ScrollView {
                /// VStack - A view that arranges it's subview in a vertical line ^
                VStack(spacing: 20) {
                    /// Creates a title key
                    Picker("Selected Stat", selection: $selectedStat) {
                        /// Using for each with the Identifiable - Got all cases by CaseIterable
                        ForEach(HealthMetricContext.allCases) { metric in
                            Text(metric.title)
                        }
                    }
                    .pickerStyle(.segmented)
                    VStack {
                        /// View that arranges it's subviews in a horizontal line ---------
                        ///  Navigation - When tapped will trigger the navigation of the screen
                        NavigationLink(value: selectedStat) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Label("Steps", systemImage: "figure.walk")
                                        .font(.title3.bold())
                                        .foregroundStyle(.pink)
                                    Text("Avg: 10K Steps")
                                        .font(.caption)
                                }
                                
                                Spacer()
                                Image(systemName: "chevron.right")
                            }
                        }
                        .padding(.bottom, 12)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 150)
                        
                    }
                    .foregroundStyle(.secondary)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                }
                
                VStack(alignment:.leading) {
                    VStack {
                        /// View that arranges it's subviews in a horizontal line ---------
                        VStack(alignment: .leading) {
                            Label("Averages", systemImage: "calendar")
                                .font(.title3.bold())
                                .foregroundStyle(.pink)
                            Text("Last 28 Days")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                        
                        .padding(.bottom, 12)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 240)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
                }
                
            }
            .padding()
            .navigationTitle("Dashboard")
            .navigationDestination(for: HealthMetricContext.self)  { metric in
                Text(metric.title)
            }
        }
        /// Ternary Operator
        .tint(isSteps ? .pink : .indigo)
    }
}

#Preview {
    ContentView()
}
