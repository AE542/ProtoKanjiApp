//
//  VocabHandler.swift
//  ProtoKanjiApp
//
//  Created by Mohammed Qureshi on 2020/11/03.
//

import Foundation
var vocabNumber = 0 //[Int]() //Int.random(in: 0...9) //must be = 0 to start off
//for i in 0...9 { vocabNumber.append(i)}


struct VocabBuilder {
    let testVocab = [ Vocab(vocabTitle: "上達", vocabHiragana: "じょうたつ", englishTranslation: "Improvement"),
                      Vocab(vocabTitle: "乗り越える", vocabHiragana: "のりこえる", englishTranslation: "To Push Through"),
                      Vocab(vocabTitle: "耐久性", vocabHiragana: "たいきゅうせい", englishTranslation: "Durability"),
    Vocab(vocabTitle: "促す", vocabHiragana: "うながす", englishTranslation: "To doubt"),
    Vocab(vocabTitle: "一律", vocabHiragana: "いちりつ", englishTranslation: "Across the board"),
    Vocab(vocabTitle: "押し切り", vocabHiragana: "おしきり", englishTranslation: "Objection"),
    Vocab(vocabTitle: "打ち込む", vocabHiragana: "うちこむ", englishTranslation: "To input") ,
    Vocab(vocabTitle: "溶け込む", vocabHiragana: "とけこむ", englishTranslation: "To get used to"),
    Vocab(vocabTitle: "放り込む", vocabHiragana: "ほうりこむ", englishTranslation: "Throw into (something)"),
    Vocab(vocabTitle: "後継者", vocabHiragana: "こうけいしゃ", englishTranslation: "Successor") ]
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
    
//    func getNoOfTimes() -> Int {
//        return testVocab[vocabNumber].noOfTimesSeen//should return an Int when called? want to implement this maybe either as a counter label or perhaps as the number on the UIView of the vocab
//    }
    
    func getEnglishTranslation() -> String {
        return testVocab[vocabNumber].englishTranslation
    }
    //create mutating func to handle moving to next Vocab
    
    mutating func nextVocab() {
      //let nextWord = vocabNumber
        NSLog("Before", "\(vocabNumber)")
        vocabNumber = (vocabNumber + Int.random(in: 0...9)) % testVocab.count
        NSLog("After", "\(vocabNumber)")
        
        pictureViewCount += 1
     
        //this was the solution after weeks of trying to get the testvocab array to loop randomly. Now it should be possible to make the first version. Remember your student who helped you get figure this out half way.
        
        //testVocab.capacity
        // this is getting the kanji to show randomly but need an infinite random Int...
        //index out of range because even though 10 items in array starts from 0
    
//        if let randomKanji = testVocab.randomElement() {
//            print(randomKanji)
//        }
//
       // vocabNumber += 1// Holy shit it finally works!!!!! add and append 1 to each Kanji in the array!!! YEEEEAAAHH
}

}
