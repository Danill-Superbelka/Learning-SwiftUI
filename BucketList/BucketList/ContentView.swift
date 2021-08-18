//
//  ContentView.swift
//  BucketList
//
//  Created by Даниил  on 18.08.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
    
    
    //Сохранение данных в памяти, FileManager
    func getDocumentsDirectory() -> URL {
        //найти все возможные каталоги документов для этого пользователя
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
