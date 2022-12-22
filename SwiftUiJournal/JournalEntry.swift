//
//  JournalEntry.swift
//  SwiftUiJournal
//
//  Created by David Svensson on 2022-12-22.
//

import Foundation


struct JournalEntry : Identifiable {
    let id = UUID()
    
    var content : String
    var date : Date = Date()
    
}
