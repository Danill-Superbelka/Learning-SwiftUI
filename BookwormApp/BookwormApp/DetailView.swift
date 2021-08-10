//
//  DetailView.swift
//  BookwormApp
//
//  Created by Даниил  on 10.08.2021.
//

import SwiftUI
import CoreData

struct DetailView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geometry.size.width)
                    
                    Text(self.book.genre?.uppercased() ?? "FANTASY")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
            }
            
            Text(self.book.author ?? "Unknown author")
                .font(.title)
                .foregroundColor(.secondary)
            
            Text(self.book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant(Int(self.book.rating)))
                .font(.largeTitle)
            
            Spacer()
        }
        .navigationBarTitle(Text(book.title ?? "Unknown book"), displayMode: .inline)
        .alert(isPresented: $showingDeleteAlert) {
                    Alert(title: Text("Delet book"), message: Text("Are you sure?"), primaryButton: .destructive(Text("Delet")) {
                            self.deletBook()
                    }, secondaryButton: .cancel()
                    )
                }
        .navigationBarItems(trailing: Button(action: {
                    self.showingDeleteAlert = true
                }) {
                    Image(systemName: "trash")
                })
    }
    
    func deletBook() {
        moc.delete(book)
        
        presentationMode.wrappedValue.dismiss()
    }
    
}

struct DetailView_Previews: PreviewProvider {
    
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test Book"
        book.author = "Test Author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "The looooong text here"
        
        return NavigationView{
            DetailView(book: book)
        }
    }
}
