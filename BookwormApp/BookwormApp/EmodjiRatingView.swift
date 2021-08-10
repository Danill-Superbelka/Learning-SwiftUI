//
//  EmodjiRatingView.swift
//  BookwormApp
//
//  Created by Даниил  on 10.08.2021.
//

import SwiftUI

struct EmodjiRatingView: View {
    
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("1")
        case 2 :
            return Text("2")
        case 3:
            return Text("3")
        case 4:
            return Text("4")
        default:
            return Text("5")
        }
    }
}

struct EmodjiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmodjiRatingView(rating: 3)
    }
}
