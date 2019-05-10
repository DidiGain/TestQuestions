//
//  YogaType.swift
//  TestQuestions
//
//  Created by Di Gain on 09/05/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

enum YogaType: String {
    case ruki = "Ruki Yogi"
    case open = "Open-minded Yogi"
    case committed = "Commetted Yogi"
    case power = "Powerhouse Yogi"

    var descriprion: String {
        switch  self {
        case .ruki:
            return "You're newer to the practice or perhaps returning to it after a break. You also might prefer a more peaceful style of practice with less spirituality."
        case .open:
            return "You have some experience with yoga. You're open to learning more about yoga, its philosophies, and incorporating some spirituality into your practice."
            
        case .committed:
             return "You may already have a regular practice and are interested in going deeper. Spirituality is a larger component of your practice and lifestyle."
        case .power:
            return "You're a fitness fan looking for challenges. But you aren’t as interested in the spiritual aspects of yoga."
        }
}
    
    var styles: String {
        switch  self {
        case .ruki:
            return "Restorative yoga, Yoga Therapy, Gentle Hatha"
        case .open:
            return "Hatha Yoga, Vinyasa Yoga, Shivanda Yoga"
        case .committed:
            return "Ashtanga Yoga, Kundalini Yoga ,Jivamukti Yoga"
        case .power:
            return "Power yoga, Yogalates, Bikram Yoga"
        }
    }
}

