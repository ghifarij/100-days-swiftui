//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Afga Ghifari on 02/04/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore: Bool = false
    @State private var scoreTitle: String = ""
    @State private var score: Int = 0
    @State private var answered: Int = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Indonesia", "Nigeria", "Poland", "Spain", "UK"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [.black, .white]), center: .center, startRadius: 0, endRadius: 800)
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    VStack(spacing: 20) {
                        VStack {
                            Text("Tap the flag of")
                                .foregroundStyle(.secondary)
                                .font(Font.body.weight(.heavy))
                            Text(countries[correctAnswer])
                                .font(Font.title.weight(.semibold))
                        }
                        .fontWeight(.bold)
                        
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .glassEffect(in: .rect())
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .glassEffect(in: .rect)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Text("Correct Answers: \(score) from \(answered)")
                        .foregroundStyle(.white)
                        .font(.body.bold())
                }
                .padding()
            }
            .navigationBarTitle("Guess The Flag")
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            score += 1
            answered += 1
        } else {
            scoreTitle = "Wrong!"
            answered += 1
        }
        
        showingScore.toggle()
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
