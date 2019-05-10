//
//  Question.swift
//  TestQuestions
//
//  Created by Di Gain on 09/05/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

extension Question {
    static func loadData() -> [Question] {
        return [
            Question(text: "What is your level of experience with yoga?",
                     type: .single,
                     answers: [
                        Answer(text: "I’ve never been to a class.",
                               type: .ruki),
                        Answer(text: "I've been to a few basic classes.",
                               type: .open),
                        Answer(text: "I am thinking about doing yoga right now.",
                               type: .committed),
                        Answer(text: "I've tried it and enjoy the workout aspect of yoga.",
                               type: .power)
                ]),
            Question(text: "Do you want to incorporate spirituality into your practice?",
                     type: .single,
                     answers: [
                        Answer(text: "I want to keep it basic.",
                               type: .ruki),
                        Answer(text: "I’m pretty open-minded.",
                               type: .open),
                        Answer(text: "I have a regular spiritual practice and I’m interested in going deeper.",
                               type: .committed),
                        Answer(text: "Not really.",
                               type: .power)
                ]),
            Question(text: "Do you want to hold poses or would you rather go with the flow?",
                     type: .single,
                     answers: [
                        Answer(text: "I want to hold the poses longer.",
                               type: .ruki),
                        Answer(text: "Some flow, some holding, I like a good mix.",
                               type: .open),
                        Answer(text: "I like to keep it moving.",
                               type: .committed),
                        Answer(text: "I don’t care as long as it’s an intense workout.",
                               type: .power)
                ]),
            Question(text: "What do you most hope to gain from your yoga practice?",
                     type: .single,
                     answers: [
                        Answer(text: "Stress-reduction",
                               type: .ruki),
                        Answer(text: "Flexibility",
                               type: .open),
                        Answer(text: "Mind-Body balance and strength",
                               type: .committed),
                        Answer(text: "A yoga butt",
                               type: .power)
                ]),
            Question(text: "What does yoga mean to you?",
                     type: .single,
                     answers: [
                        Answer(text: "Breathing and stretching; a way for me to relax.",
                               type: .ruki),
                        Answer(text: "A technology for integrating body, mind, and spirit.",
                               type: .open),
                        Answer(text: "A spiritual and physical practice, as well as a philosophy to live by.",
                               type: .committed),
                        Answer(text: "Balance, strength, and flexibility",
                               type: .power)
                ])
        ]
    }
}
