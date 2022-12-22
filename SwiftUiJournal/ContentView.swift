//
//  ContentView.swift
//  SwiftUiJournal
//
//  Created by David Svensson on 2022-12-22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var journal = Journal()
    
    
    var body: some View {
        NavigationView {
            
            
            List(journal.entries) { entry in
                NavigationLink(destination: JournalEntryView(journal: journal, entry: entry) ){
                    RowView(entry: entry)
                }
            }
            .navigationBarTitle("Journal")
            .navigationBarItems(trailing: NavigationLink(destination: JournalEntryView(journal: journal)) {
                Image(systemName: "plus.circle")
            })
        }
    }
}


struct RowView : View {
    var entry : JournalEntry
    
    var date : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: entry.date)
    }
    
    var body: some View {
        HStack {
            Text("\(date)")
            Spacer()
            Text(entry.content.prefix(7) + "...")
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
