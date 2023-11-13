//
//  FLORYApp.swift
//  FLORY
//
//  Created by gourderased on 2023/09/20.
//

import SwiftUI

@main
struct FLORYApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SharedData())
        }
    }
}
