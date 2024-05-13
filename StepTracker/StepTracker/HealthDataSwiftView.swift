//
//  HealthDataSwiftView.swift
//  StepTracker
//
//  Created by Briana Bayne on 5/12/24.
//

import SwiftUI

struct HealthDataSwiftView: View {
    
    // MARK: - Properties
    
    @State private var isShowingAddData = false
    @State private var addDataDate: Date = .now
    @State private var valueToAdd: String = ""
    
    var metric: HealthMetricContext
    
    /// Parent View
    var body: some View {
        /// Making Twenty Eight Rows in the HStack
        List(0..<28) { i in
            /// HStack - Creates a tableView
            HStack {
                Text(Date(), format: .dateTime.month().day().year())
                Spacer()
                Text(10000, format: .number.precision(.fractionLength(metric == .steps ? 0 : 1)))
            }
        }
        .navigationTitle(metric.title)
        .sheet(isPresented: $isShowingAddData) {
            addDataView
        }
        .toolbar {
            Button("Add Data", systemImage: "plus") {
                isShowingAddData = true
            }
        }
    }
    /// This view is everything in the + Sign - Child view to body
    var addDataView: some View {
        NavigationStack {
            /// Forms are special kind of container view that allow to group input controls together, applying platform appropriate styling to them automatically. Forms are ideal for building user interface that allow data entry, like settings or sign up/sign in views
            Form {
                DatePicker("Date", selection: $addDataDate, displayedComponents: .date)
                HStack {
                    Text(metric.title)
                    Spacer()
                    TextField("Value", text: $valueToAdd)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 140)
                        .keyboardType(metric == .steps ? .numberPad: .decimalPad)
                }
            }
            .navigationTitle(metric.title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Data") {
                        // code later
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Dismiss") {
                        isShowingAddData = false
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HealthDataSwiftView(metric: .weight)
    }
}
