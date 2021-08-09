//
//  ContentView.swift
//  BookwormApp
//
//  Created by Даниил  on 05.08.2021.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc

    @State private var showingAddScreen = false
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Name of book", text: $title)
                    TextField("Author`s name", text: $author)
                    
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    Picker("Rating", selection: $rating){
                        ForEach(0..<6){
                            Text("\($0)")
                        }
                    }
                    TextField("Write a review", text: $review)
                }
                
                Section{
                    
                    Button("Save"){
                        let newBook = Book(context: self.moc)
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        newBook.genre = self.genre
                        newBook.review = self.review
                        
                        try? self.moc.save()
                    }
                }
            }
            .navigationBarTitle("AddBook")
        }
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
