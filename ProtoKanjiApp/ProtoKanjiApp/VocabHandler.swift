//
//  VocabHandler.swift
//  ProtoKanjiApp
//
//  Created by Mohammed Qureshi on 2020/11/03.
//
import UIKit
import Foundation

//func viewDidLoad(){
//    let defaults = UserDefaults.standard
//    if let savedVocabArray = defaults.object(forKey: "VocabAll") as? [String] ?? [String]() {
//    //if let savedVocab = defaults.data(forKey: "VocabAll") {
//        let jsonDecoder = JSONDecoder()
//        do {
//            try jsonDecoder.decode(_: Vocab.self, from: savedVocabArray)
//        } catch {
//            print("Unable to save data")
//        }
//        
//    }
//
//    
//}


var vocabNumber = 0 //[Int]() //Int.random(in: 0...9) //must be = 0 to start off
//for i in 0...9 { vocabNumber.append(i)}
//var counter = Vocab.AccessCounter(wrappedValue: (Any).self)


struct VocabBuilder {
    var testVocab = [ Vocab(vocabTitle: "上達", vocabHiragana: "じょうたつ", englishTranslation: "Improvement", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "乗り越える", vocabHiragana: "のりこえる", englishTranslation: "To Push Through", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "耐久性", vocabHiragana: "たいきゅうせい", englishTranslation: "Durability", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "促す", vocabHiragana: "うながす", englishTranslation: "To urge", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "一律", vocabHiragana: "いちりつ", englishTranslation: "Across the board", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "押し切り", vocabHiragana: "おしきり", englishTranslation: "Objection", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "打ち込む", vocabHiragana: "うちこむ", englishTranslation: "To input", noOfTimesSeen: 0) ,
                      Vocab(vocabTitle: "溶け込む", vocabHiragana: "とけこむ", englishTranslation: "To get used to", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "放り込む", vocabHiragana: "ほうりこむ", englishTranslation: "Throw into (something)", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "後継者", vocabHiragana: "こうけいしゃ", englishTranslation: "Successor", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "差しかける", vocabHiragana: "さしかける", englishTranslation: "To approach", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "廃れる", vocabHiragana: "すたれる", englishTranslation: "Go out of fashion", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "絡む", vocabHiragana: "からむ", englishTranslation: "To become entangled/stuck", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "軽快な", vocabHiragana: "けいかいな", englishTranslation: "Rhythmic", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "和やかな", vocabHiragana: "なごやかな", englishTranslation: "Calm,Gentle", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "煌びやかな", vocabHiragana: "きらびやかな", englishTranslation: "Gorgeous", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "乏しい", vocabHiragana: "とぼしい", englishTranslation: "Scarce", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "容易い", vocabHiragana: "たやすい", englishTranslation: "Without much thought", noOfTimesSeen:0),
                      Vocab(vocabTitle: "疎かな", vocabHiragana: "おろそかな", englishTranslation: "Negligent/Careless", noOfTimesSeen: 0),
                      Vocab(vocabTitle: "自ら", vocabHiragana: "みずから", englishTranslation: "One's own initiative", noOfTimesSeen: 0),]
    var pictureViewCount: Int = 0
    //Remember we want to have the answer only appear after the user has input 3 times. Maybe show it as a seperate AC?
    let words = [Vocab]()// use this to count each word in the array?
     //var pictureViewCount = [String: Int]()
    

    
    func getVocab() -> String {
        
        return testVocab[vocabNumber].vocabTitle
        
        //needs a var to handle the vocab selected.
    }// error in that random Int is hitting a number that isn't in the array... need to change the vocabNumber.
    
    func getHiragana() -> String {
        return testVocab[vocabNumber].vocabHiragana
    }
    
    mutating func getNoOfTimes() -> Int {
        //pictureViewCount += 1
        //testVocab.count + 1
        //testVocab.count
        testVocab[vocabNumber].incrementNoOfTimesSeen()
        
        return testVocab[vocabNumber].noOfTimesSeen
        
        //testVocab.count[vocabNumber].noOfTimesSeen
        
        
        //should return an Int when called? want to implement this maybe either as a counter label or perhaps as the number on the UIView of the vocab
        //return testVocab[vocabNumber].noOfTimesSeen.advanced(by: 1) not working.
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
       
        //pictureViewCount += 1
     
        //this was the solution after weeks of trying to get the testvocab array to loop randomly. Now it should be possible to make the first version. Remember your student who helped you figure this out half way.
        
        //testVocab.capacity
        // this is getting the kanji to show randomly but need an infinite random Int...
        //index out of range because even though 10 items in array starts from 0
    
//        if let randomKanji = testVocab.randomElement() {
//            print(randomKanji)
//        }
//
       // vocabNumber += 1// Holy shit it finally works!!!!! add and append 1 to each Kanji in the array!!! YEEEEAAAHH
}
    
    func save() {
        
        let defaults = UserDefaults.standard
        defaults.setValue(pictureViewCount, forKey: "pictureViewCount")

        if let savedViewCount = defaults.value(forKey: "pictureViewCount") as? Int {
            print("saved value: \(savedViewCount)")
        }
        //add JSONEncoder
//        do {
//        let jsonEncoder = JSONEncoder()
//        let defaults = UserDefaults.standard
//        let vocabViews = testVocab.capacity
//        let data = try jsonEncoder.encode(vocabViews)
//        //let savedVocabArray = defaults.object(forKey: "VocabAll") as? [String] ?? [String]()
//            defaults.setValue(Array<Any>.self, forKey: "VocabAll")
//
//        } catch {
//            print("Unable to save data.")
//        }
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
