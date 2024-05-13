//
//  StepTrackerApp.swift
//  StepTracker
//
//  Created by Briana Bayne on 5/11/24.
//

import SwiftUI

@main
struct StepTrackerApp: App {
   
    let hkManager = HealthKitManager()
    
    var body: some Scene {
        WindowGroup {
           DashboardView()
                .environment(hkManager)
        }
    }
}
