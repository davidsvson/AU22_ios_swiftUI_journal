//
//  SwiftUiJournalApp.swift
//  SwiftUiJournal
//
//  Created by David Svensson on 2022-12-22.
//

import SwiftUI

@main
struct SwiftUiJournalApp: App {
    
    @StateObject var journal = Journal()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(journal)
        }
    }
}
