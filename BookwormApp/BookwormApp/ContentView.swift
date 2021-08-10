//
//  ContentView.swift
//  BookwormApp
//
//  Created by Даниил  on 05.08.2021.
//

import SwiftUI

struct ContentView: View {
   
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true),
        NSSortDescriptor(keyPath: \Book.author, ascending: true)
    ]) var books: FetchedResults<Book>

    @State private var showingAddScreen = false
    
   var body: some View {
        NavigationView{
            List{
                ForEach(books, id: \.self) { book in
                    NavigationLink(destination: DetailView(book: book)) {
                        EmodjiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown Title")
                                .font(.headline)
                            Text(book.author ?? "Unknown Author")
                        }
                    }
                    
                }
                .onDelete(perform: deleteBooks)
            }
        }
        .navigationBarTitle("Bookworm")
        .navigationBarItems(leading: EditButton() ,trailing: Button(action: {
            self.showingAddScreen.toggle()
        }) {
            Image(systemName: "Plus")
            
            }
        )
        .sheet(isPresented: $showingAddScreen) {
            AddBookView().environment(\.managedObjectContext, self.moc)
        }
    }
    
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]

            moc.delete(book)
        }
        try? moc.save()
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
