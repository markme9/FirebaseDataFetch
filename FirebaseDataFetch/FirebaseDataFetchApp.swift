//
//  FirebaseDataFetchApp.swift
//  FirebaseDataFetch
//
//  Created by zoya me on 11/9/22.
//

import SwiftUI
import Firebase

@main
struct FirebaseDataFetchApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
