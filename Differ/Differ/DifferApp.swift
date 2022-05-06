//
//  DifferApp.swift
//  Differ
//
//  Created by 김유나 on 2022/04/29.
//

import SwiftUI

@main
struct DifferApp: App {
        
    var body: some Scene {
        WindowGroup {
            ViewRouter()
                .environmentObject(ModelData())
        }
    }
}
