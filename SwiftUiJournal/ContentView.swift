//
//  ContentView.swift
//  SwiftUiJournal
//
//  Created by David Svensson on 2022-12-22.
//

import SwiftUI

// gör en att göra app eller en shopinglist app


struct ContentView: View {
    //@StateObject var journal = Journal()
    @EnvironmentObject var journal : Journal
   
   
    
    var body: some View {
        NavigationView {
            
            
            List() {
                ForEach(Array(journal.entries.enumerated()), id: \.offset) { i, entry in
                    NavigationLink(destination: JournalEntryView( entry: entry) ){
                        RowView(entry: entry, row: i)
                    }
                }
                .onDelete() { indexSet in
                    delete(indexSet: indexSet)
                }
            }
            .navigationBarTitle("Journal")
            .navigationBarItems(trailing: NavigationLink(destination: JournalEntryView()) {
                Image(systemName: "plus.circle")
            })
        }
    }
    
    func delete(indexSet: IndexSet) {
        journal.entries.remove(atOffsets: indexSet)
    }
}




struct RowView : View {
    var entry : JournalEntry
    var row : Int
    
    var date : String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        return dateFormatter.string(from: entry.date)
    }
    
    var body: some View {
        HStack {
            Text("\(date)")
            Spacer()
            Text("\(row)")
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
