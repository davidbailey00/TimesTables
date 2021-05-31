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

struct ContentView: View {
    @State private var timesTable = 2
    @State private var questionAmount = QuestionAmount.ten

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Game settings")) {
                    Stepper(value: $timesTable, in: 2 ... 12) {
                        Text("\(timesTable) times table")
                    }

                    HStack {
                        Text("Questions")
                        Spacer()
                        Picker("Questions", selection: $questionAmount) {
                            ForEach(QuestionAmount.allCases, id: \.self) { amount in
                                Text(amount.rawValue)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(maxWidth: 184)
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
