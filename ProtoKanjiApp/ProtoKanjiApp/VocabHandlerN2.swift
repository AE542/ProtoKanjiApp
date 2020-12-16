//
//  VocabHandlerN2.swift
//  ProtoKanjiApp
//
//  Created by Mohammed Qureshi on 2020/12/03.
//
import UIKit
import Foundation



var vocabNumberN2 = 0
//var counterN2 = Vocab.AccessCounter(wrappedValue: (Any).self)

struct VocabBuilderN2 {
    var testVocab = [ Vocab(vocabTitle: "上達", vocabHiragana: "じょうたつ", englishTranslation: "Improvement", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "乗り越える", vocabHiragana: "のりこえる", englishTranslation: "To Push Through", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "耐久性", vocabHiragana: "たいきゅうせい", englishTranslation: "Durability", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "促す", vocabHiragana: "うながす", englishTranslation: "To urge", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "一律", vocabHiragana: "いちりつ", englishTranslation: "Across the board", noOfTimesSeen: 0)]
    
    var pictureViewCount: Int = 0
    
    let words = [Vocab]()// use this to count each word in the array?
 
    

    
    func getVocab() -> String {
        
        return testVocab[vocabNumber].vocabTitle
    }
    
    func getHiragana() -> String {
        return testVocab[vocabNumber].vocabHiragana
    }
    
    mutating func getNoOfTimes() -> Int {
       
        
        return testVocab[vocabNumber].noOfTimesSeen
        
   
    }
   
    func getEnglishTranslation() -> String {
        return testVocab[vocabNumber].englishTranslation
    }
    //create mutating func to handle moving to next Vocab
    
    mutating func nextVocab() {
      //let nextWord = vocabNumber
        NSLog("Before", "\(vocabNumber)")
        vocabNumber = (vocabNumber + Int.random(in: 0...19)) % testVocab.count
        //pictureViewCount += 1
        
        
        save()
        NSLog("After", "\(vocabNumber)")
    
}
    
    func save() {
        
        let defaults = UserDefaults.standard
        defaults.setValue(pictureViewCount, forKey: "pictureViewCount")

        if let savedViewCount = defaults.value(forKey: "pictureViewCount") as? Int {
            print("saved value: \(savedViewCount)")
        }

    }
    
//    @propertyWrapper
//        class AccessCounter<T> {
//            private let _wrapped: T
//            private (set) var pictureViewCountNew: Int = 0
//            var wrappedValue: T {
//                pictureViewCountNew += 1
//                
//                return _wrapped
//            }
//            init(wrappedValue: T) {
//                _wrapped = wrappedValue
//            }
//        }
    
    
    

}
