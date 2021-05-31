//
//  ContentView.swift
//  TimesTables
//
//  Created by David Bailey on 31/05/2021.
//

import SwiftUI

enum QuestionAmount: String, CaseIterable, Identifiable {
    case five = "5"
    case ten = "10"
    case twenty = "20"
    case all = "All"

    var id: String { self.rawValue }
}

struct Question {
    var multiplicand: Int
    var multiplier: Int
}

struct ContentView: View {
    @State private var timesTable = 2
    @State private var maxMultiplier = 10

    @State private var questionAmount = QuestionAmount.ten
    @State private var randomOrder = true
    @State private var questions: [Question]? = nil

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Game settings")) {
                    Stepper(value: $timesTable, in: 2 ... 12) {
                        Text("\(timesTable) times table")
                    }

                    Stepper(value: $maxMultiplier, in: 3 ... 12) {
                        Text("Up to \(timesTable) × \(maxMultiplier)")
                    }

                    HStack {
                        Text("Questions")
                        Spacer()
                        Picker("Questions", selection: $questionAmount) {
                            ForEach(QuestionAmount.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(maxWidth: 184)
                    }

                    if questionAmount == .all {
                        Toggle("Random order", isOn: $randomOrder)
                    }
                }

                Section {
                    Button(action: {
                        // @TODO
                    }) {
                        HStack {
                            Image(systemName: "play.circle.fill")
                            Text("Start game")
                        }
                    }
                }
            }
            .navigationTitle("Times Tables")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
