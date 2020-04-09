//
//  ContentView.swift
//  Guess
//
//  Created by slawomir  on 07/04/2020.
//  Copyright © 2020 slawomir . All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France","Germany", "Ireland", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "US", "UK"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    
    var body: some View {
        ZStack  {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        VStack (spacing: 30) {
            VStack {
                Text("tap the flag of")
                    .font(.largeTitle)
                Text(countries[correctAnswer])
                    .font(.largeTitle)
                    .fontWeight(.black)
                Text("Your current score is \(score)")
                    .fontWeight(.bold)
            }
            Spacer()
            ForEach(0 ..< 3) { number in
                Button(action: {
                    self.flagTapped(number)
                }) {
                    Image(self.countries[number])
                    .renderingMode(.original)
                    .shadow(radius: 2)
                }
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
            }
    }
    }
        func flagTapped(_ number: Int) {
            if number == correctAnswer {
                scoreTitle = "Correct"
                score += 1
            } else {
                scoreTitle = "Wrong you Moron"
            }
            showingScore = true
        }
        func askQuestion() {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
