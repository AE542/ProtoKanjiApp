//
//  VocabInfo.swift
//  ProtoKanjiApp
//
//  Created by Mohammed Qureshi on 2020/11/03.
//

import Foundation

struct Vocab {
    
    let vocabTitle: String
    let vocabHiragana: String
    let englishTranslation: String
    var noOfTimesSeen: Int = 0// to hold the view count? // change to number instead of No for clarity.
    //let vocabNo: Int Don't need this as solved the move to next word problem.
    mutating func incrementNoOfTimesSeen() {
        noOfTimesSeen += 1
    }//after months and months THIS WAS THE SOLUTION TO GETTING THE VIEW COUNT TO INCREMENT FOR EACH INDIVIDUAL ITEM IN THE VOCAB ARRAY!!!!!!
    //left side of operator is immutable... because its in a struct so we have to use mutating here to make it mutable. DON'T FORGET WHAT GO SAID!
    
    mutating func resetNumberOfTimesSeen() {
        noOfTimesSeen = 0
    }
    //mutating func have to be used in structs.

//@propertyWrapper
//    class AccessCounter<T> {
//        private let _wrapped: T
//        private (set) var count: Int = 0
//        var wrappedValue: T {
//            count += 1
//
//            return _wrapped
//        }
//        init(wrappedValue: T) {
//            _wrapped = wrappedValue
//        }
//    }
}

