//
//  HealthKitPermissionPrimingView.swift
//  StepTracker
//
//  Created by Briana Bayne on 5/13/24.
//

import SwiftUI
import HealthKitUI

struct HealthKitPermissionPrimingView: View {
    
    // MARK: - Properties
    
    @Environment(HealthKitManager.self) private var hkManager
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingHealthKitPermissions = false
    
    var description = """
    This app displays your step and weight data in interactive charts.

 You can also add new step or weight data to Apple Health from this app. Your data is private and secured.
"""
    
    var body: some View {
        VStack(spacing: 130) {
            VStack(alignment: .leading,spacing: 10) {
                Image(.appleHealth)
                    .resizable()
                    .frame(width: 90, height: 90)
                    .shadow(color: .gray.opacity(0.3), radius: 16)
                    .padding(.bottom, 12)
                Text("Apple Health Integration")
                    .font(.title2.bold())
                
                Text(description)
                    .foregroundStyle(.secondary)
            }
            
            Button("Connect Apple Health") {
                isShowingHealthKitPermissions = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.pink)
        }
        .padding(30)
        .healthDataAccessRequest(store: hkManager.store,
                                 shareTypes: hkManager.types,
                                 readTypes: hkManager.types,
                                 trigger: isShowingHealthKitPermissions) { result in
            
            switch result {
            case .success(_):
                // Handel Success
                dismiss()
            case .failure(_):
                // handle the error later
                dismiss()
            }
        }
    }
}

#Preview {
    HealthKitPermissionPrimingView()
    /// Injecting the Environment into the Preview so it doesn't break
        .environment(HealthKitManager())
}
