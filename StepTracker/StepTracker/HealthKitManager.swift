//
//  HealthKitManager.swift
//  StepTracker
//
//  Created by Briana Bayne on 5/13/24.
//

import Foundation
import HealthKit
import Observation

@Observable class HealthKitManager {
    
 
    let store = HKHealthStore()
    
    let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
}
