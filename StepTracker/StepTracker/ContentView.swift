//
//  ContentView.swift
//  StepTracker
//
//  Created by Briana Bayne on 5/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        /// Navigation Stack - View that displays a root view and enables you to present additional views over the root view.
        NavigationStack {
            ScrollView {
                /// VStack - A view that arranges it's subview in a vertical line ^
                VStack(spacing: 20) {
                    VStack {
                        /// View that arranges it's subviews in a horizontal line ---------
                        HStack {
                            VStack(alignment: .leading) {
                                Label("Steps", systemImage: "figure.walk")
                                    .font(.title3.bold())
                                    .foregroundStyle(.pink)
                                Text("Avg: 10K Steps")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.secondary)
                        }
                        .padding(.bottom, 12)
                        
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.secondary)
                            .frame(height: 150)
                    }
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
        }
    }
}

#Preview {
    ContentView()
}
