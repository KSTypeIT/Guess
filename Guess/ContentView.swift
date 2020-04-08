//
//  ContentView.swift
//  Guess
//
//  Created by slawomir  on 07/04/2020.
//  Copyright © 2020 slawomir . All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    var countries = ["Poland", "Ireland", "Italy", "US", "UK", "Russia", "France", "Estonia", "Spain", "Germany", "Monaco"]
    var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        VStack(spacing: 30){
            VStack {
                    Text("tap the flag of")
                    Text(countries[correctAnswer])
                }
        
            ForEach(0 ..< 3) { number in
            Button(action: {
            //flag tapped
            })
                Image(self.countries[number])
                .renderingMode(.original)
//            Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
