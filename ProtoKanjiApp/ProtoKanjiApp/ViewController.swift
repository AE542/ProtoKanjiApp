//
//  ViewController.swift
//  ProtoKanjiApp
//
//  Created by Mohammed Qureshi on 2020/11/03.
//

import UIKit

class ViewController: UIViewController {
    var greySquare: UIView!
    var answerBox: UILabel!
    var continueButton: UIButton!
    var inputButton: UIButton!
    var rightWrongAnswerBox: UILabel!
    let rightWrongText = String()
    var englishTranslationBox: UILabel!
    var hiraganaBox: UILabel!
    var viewCountBox: UILabel!
    
    var userInputs: String?
    
    let numberOfAttempts = 3// want this to handle the number of inputs attempted before it shows hiragana.
    
    var viewedVocab = [String]()
    
    var pictureViewCount: Int = 0
    
    //var picViewCount: [Int] = []
   // var pictureViewCount = 0

    
    //var vocabRetrieved = VocabBuilder()
    
    //loadView used to be here but its better its loaded from viewDidLoad.
    
    var vocabInfo = VocabBuilder() //create var to handle the struct info
    
        override func viewDidLoad() {
             super.viewDidLoad()
        
            
            func loadView() {
            view = UIView()
                
                view.backgroundColor = .white
                
    
               answerBox = UILabel()
                answerBox.backgroundColor = UIColor.white
                answerBox.layer.borderColor = UIColor(white: 0, alpha: 1.0).cgColor// white set to 0 then alpha to 1.0 to get a border.
                answerBox.layer.borderWidth = 0.5
                answerBox.layer.cornerRadius = 3
                answerBox.translatesAutoresizingMaskIntoConstraints = false //need this so we don't send it flying off the screen.
                answerBox.font = UIFont.systemFont(ofSize: 54)//changing from text to .font was the solution. because can't assing type text to UILabel
                //answerBox.adjustsFontSizeToFitWidth = true
                answerBox.textAlignment = .center
                //answerBox.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(answerBox)
            
        
            continueButton = UIButton()
            continueButton.backgroundColor = UIColor.blue
            continueButton.layer.borderColor = UIColor(white: 0, alpha: 0.5).cgColor
            continueButton.layer.borderWidth = 0.4
            continueButton.layer.cornerRadius = 3
            continueButton.setTitle("Next Word", for: .normal)
            continueButton.translatesAutoresizingMaskIntoConstraints = false
            continueButton.addTarget(self, action: #selector(continueToNextWord), for: .touchUpInside)
            view.addSubview(continueButton)
            //now the continue button is showing up green as expected in the right size...after many attempts
            
            inputButton = UIButton()
            inputButton.backgroundColor = UIColor.green
            inputButton.layer.borderColor = UIColor(white: 0, alpha: 0.5).cgColor
            inputButton.layer.borderWidth = 0.4
            inputButton.layer.cornerRadius = 3
                inputButton.setTitle("Submit", for: .normal)
            //this is how you set text for a button.
            inputButton.translatesAutoresizingMaskIntoConstraints = false
            //need to make input button with objc func
            inputButton.addTarget(self, action: #selector(answerAttempt), for: .touchUpInside)//remember this allows the button to be touched and then causes the action to happen.
            view.addSubview(inputButton)
            //we need to connect his to the view and I need to get a text field to allow input into the field.
            
           rightWrongAnswerBox = UILabel()
            rightWrongAnswerBox.backgroundColor = UIColor.clear
            rightWrongAnswerBox.layer.borderColor = UIColor(white: 0, alpha: 0.5).cgColor
            rightWrongAnswerBox.layer.borderWidth = 0.4
            rightWrongAnswerBox.layer.cornerRadius = 3
            rightWrongAnswerBox.text = "Try and Remember!"
            rightWrongAnswerBox.textColor = .black
            rightWrongAnswerBox.font = UIFont.systemFont(ofSize: 34)
            rightWrongAnswerBox.textAlignment = .center // this put the word in the centre of the UILabel.
             rightWrongAnswerBox.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(rightWrongAnswerBox)
            //don't use UITextView! Use a UILabel like in all the tutorials so far.
            
                
            englishTranslationBox = UILabel()
            englishTranslationBox.backgroundColor = UIColor.clear
            englishTranslationBox.layer.borderColor = UIColor(white: 0, alpha: 0.5).cgColor
            englishTranslationBox.layer.borderWidth = 0.4
            englishTranslationBox.layer.cornerRadius = 3
            englishTranslationBox.text = "Translation here"
            englishTranslationBox.font = UIFont.systemFont(ofSize: 24)
            englishTranslationBox.textAlignment = .center
            englishTranslationBox.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(englishTranslationBox)
                
                
            hiraganaBox = UILabel()
            hiraganaBox.backgroundColor = UIColor.clear
            hiraganaBox.layer.borderColor = UIColor(white: 0, alpha: 0.5).cgColor
            hiraganaBox.layer.borderWidth = 0.4
            hiraganaBox.layer.cornerRadius = 3
            hiraganaBox.font = UIFont.systemFont(ofSize: 24)
            hiraganaBox.textAlignment = .center
    
            hiraganaBox.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(hiraganaBox)
            
            viewCountBox = UILabel()
            viewCountBox.backgroundColor = UIColor.clear
            viewCountBox.layer.borderColor = UIColor(white: 0, alpha: 0.5).cgColor
            viewCountBox.layer.borderWidth = 0.4
            viewCountBox.layer.cornerRadius = 3
            viewCountBox.font = UIFont.systemFont(ofSize: 28)
                //viewCountBox.text = "0"
            //need to add viewcount using NSDefaults.
            viewCountBox.textAlignment = .center
            viewCountBox.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(viewCountBox)
                
        
            NSLayoutConstraint.activate([
                
                rightWrongAnswerBox.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50),
                rightWrongAnswerBox.centerXAnchor.constraint(equalTo:
                    view.layoutMarginsGuide.centerXAnchor),
                
                viewCountBox.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
                viewCountBox.topAnchor.constraint(equalTo: hiraganaBox.bottomAnchor),
                viewCountBox.widthAnchor.constraint(equalToConstant: 260),
                viewCountBox.heightAnchor.constraint(equalToConstant: 50),
                
                
                answerBox.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 150),//moved up the box seems to look better now.
                //try to see if we can equal top anchor constraint to to equal the rightWrongAnswerBox
                answerBox.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -400),
                //answerBox.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
                answerBox.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
                answerBox.heightAnchor.constraint(equalToConstant: 50),
                answerBox.widthAnchor.constraint(equalToConstant: 300),// this seems to be slightly more accurate when getting specific positions.
                
                
                inputButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 60),
                inputButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -150),
                inputButton.widthAnchor.constraint(equalToConstant: 120),
                inputButton.heightAnchor.constraint(equalToConstant: 60),
                
                continueButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -60),
                continueButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -150),
                continueButton.widthAnchor.constraint(equalToConstant: 120),
                continueButton.heightAnchor.constraint(equalToConstant: 60),
                // continueButton.leadingAnchor.constraint(equalTo: inputButton.trailingAnchor),
                
                englishTranslationBox.widthAnchor.constraint(equalToConstant: 230),
                englishTranslationBox.heightAnchor.constraint(equalToConstant: 50),
                englishTranslationBox.topAnchor.constraint(equalTo: answerBox.bottomAnchor),
                englishTranslationBox.centerXAnchor.constraint(equalTo:view.layoutMarginsGuide.centerXAnchor),
                //inputButton.topAnchor.constraint(equalTo: answerBox.bottomAnchor),
                hiraganaBox.widthAnchor.constraint(equalToConstant: 230),
                hiraganaBox.heightAnchor.constraint(equalToConstant: 50),
                hiraganaBox.centerXAnchor.constraint(equalTo: view.layoutMarginsGuide.centerXAnchor),
                hiraganaBox.topAnchor.constraint(equalTo: englishTranslationBox.bottomAnchor)
    //
            ])
                
                
        }// moved from above into viewDidLoad instead
            
        loadView()

        
        loadUI()
            
        //can't put save func below loadUI() as it doesn't save the first item in the array.
            
        let defaults = UserDefaults.standard
        
        //let savedData = pictureViewCount
            
        if let savedViewCount = defaults.value(forKey: "picVC") as? Int {
                
        //pictureViewCount += 1
        print("savedValue: \(savedViewCount + 1)")
            
            }
        
            }
    
 
    func loadUI() {
       
        answerBox.text = vocabInfo.getVocab()
        
        //Is showing the vocab but not in a box...
        englishTranslationBox.text = vocabInfo.getEnglishTranslation()
        
        hiraganaBox.textColor = .white// this is keeping the hiragana hidden. Now need to work on the loop to keep it hidden for 3 attempts
        
        hiraganaBox.text = vocabInfo.getHiragana()
        //hideHiragana()
        
        
        viewCountBox.text = ("View Count: \(pictureViewCount)")
        
       // let items = vocabRetrieved.testVocab
        
        //for item in vocabRetrieved.testVocab {
           // picViewCount[(pictureViewCount)] += 1
            
       // }
        //save()
//        wordViewCount += 1
         //can't put view count here.
//        save()
       // vocabRetrieved.testVocab[vocabInfo.getVocab()]
        //("\(pictureViewCount)")
        rightWrongAnswerBox.text = "Try and Remember!"
        rightWrongAnswerBox.textColor = .black
        
    pictureViewCount += 1
        save()
        
}
    
    
    
    func submit(answer: String) {
        
        
        if hiraganaBox.text == answer {
           // print("Correct")
            let ac = UIAlertController(title: "Correct!", message: "Go to the next word!", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
             present(ac, animated: true)
            hiraganaBox.textColor = .black
            rightWrongAnswerBox.text = "Correct!"
            rightWrongAnswerBox.textColor = .green
            //pictureViewCount[answer]! += 1
            //print((pictureViewCount))
            //viewCountBox.text = ("\(wordViewCount + 1)")
            //vocabRetrieved.testVocab[]
            //save()
            view.reloadInputViews()
        } else if hiraganaBox.text != answer {
            let ac = UIAlertController(title: "Incorrect!", message: "Give it another go.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
             present(ac, animated: true)
            rightWrongAnswerBox.text = "Incorrect"
            rightWrongAnswerBox.textColor = .red
            
            //print("Incorrect")
        }
        
        
    }


    
    @objc func answerAttempt (_ sender: UIButton) {
        //now we have to create the logic ;
        //when the user presses the answer button, I want a text field maybe as an alert controller to come up to put hiragana only in for the answer. If it matches then good! Then it hides the button to stop repeated presses. If wrong try 3 times before it shows the answer.
        let ac = UIAlertController(title: "What is this word in Hiragana?", message: "Enter your answer into the box below", preferredStyle: .alert)
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default){
            [weak ac] action in// make a closure to handle text field.
            guard let answer = ac?.textFields?[0].text else { return }
            //self?.submit(answer)// create submit func below to allow entry into the text field as a string.
            
            self.submit(answer: answer)//Cannot use optional chaining on non-optional value of type 'ViewController' error
            //OK! changing it to self.submit (answer: answer) made it correct!!!
            // attempt to get inputs to match text
            
            
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    @objc func continueToNextWord (_ sender: UIButton) {

        
        vocabInfo.nextVocab() // unable to get info triggering...
       // let vocabNoIncrease = vocabInfo.getNoOfTimes()
        //pictureViewCount[vocabNoIncrease] += 1 index out of error range
        //pictureViewCount[savedWord()]+= 1
        //pictureViewCount[vocabInfo.getNoOfTimes()]! += 1
        //vocabInfo.getNoOfTimes()
        //let viewCount = pictureVC
        //pictureVC.viewCount + 1
        //save()
        //save func should save word here?
        //pictureViewCount["\(vocabInfo.getNoOfTimes())"] expression uses unused subscript
        //answerBox.text = vocabInfo.getVocab() don't need this as vocabInfo handles taking all the data from the Models.
    //vocabNumber + 1
       
    loadUI()
       
       
}
    func save(){
        //let jsonEncoder = JSONEncoder()
        
        //if let saveNumber = try?jsonEncoder.encode(pictureViewCount) { //Instance member 'encode' cannot be used on type 'JSONEncoder'; did you mean to use a value of this type instead? should have been the actual constant jsonEncoder
           // let savedWord = try?jsonEncoder.encode(vocabInfo.getVocab())
            // doesn't need to be an if let don't need to unwrap anything.
            
        let defaults = UserDefaults.standard
        let savedData = pictureViewCount

        defaults.setValue(savedData, forKey: "picVC")
        
//        let currentCount = UserDefaults.standard.integer(forKey: "picVC")
//
//        UserDefaults.standard.setValue(currentCount + 1, forKey: "picVC")
            //defaults.set(saveData, forKey: "pictureViewCount")
            //defaults.setValue(savedWord, forKey: "savedWord")
//        } else {
//            print("Failed to save View Count.")
//        }
    }
}


