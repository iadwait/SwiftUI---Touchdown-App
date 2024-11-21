//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Adwait Barkale on 12/11/24.
//

import SwiftUI

@main
struct TouchdownApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Shop())
        }
    }
}
