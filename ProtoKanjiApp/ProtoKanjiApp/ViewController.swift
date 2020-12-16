//
//  ViewController.swift
//  ProtoKanjiApp
//
//  Created by Mohammed Qureshi on 2020/11/03.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    

    
    
    //var greySquare: UIView!
    var answerBox: UILabel!
    var continueButton: UIButton!
    var inputButton: UIButton!
    var rightWrongAnswerBox: UILabel!
    let rightWrongText = String()
    var englishTranslationBox: UILabel!
    var hiraganaBox: UILabel!
    var viewCountBox: UILabel!
    
    var changeLevel: UIButton!
    
    var userInputs: String?
    
    //let numberOfAttempts = 3// want this to handle the number of inputs attempted before it shows hiragana.
    

    var viewedVocab = [String]()
    
    var pictureViewCount: Int = 0
    
    var answerAttemptCount = 0
    //var picViewCount: [Int] = []
   // var pictureViewCount = 0

    
    //var vocabRetrieved = VocabBuilder()
    
    //loadView used to be here but its better its loaded from viewDidLoad.
    
    var vocabInfo = VocabBuilder() //create var to handle the struct info
    
    var vocabInfoN2 = VocabBuilderN2()
    
    //let increment = VocabBuilder.AccessCounter(wrappedValue: 0)
    
        override func viewDidLoad() {
             super.viewDidLoad()
            //let barHeight2: CGFloat =
//            let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
//            let displayWidth: CGFloat = self.view.frame.width
//            let displayHeight: CGFloat = self.view.frame.height
//            levelTableView = UITableView(frame: CGRect(x: 0, y:barHeight, width: displayWidth, height: displayHeight - barHeight))
//            levelTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//            levelTableView.dataSource = self
//            levelTableView.delegate = self
//            self.view.addSubview(levelTableView)
            title = "何回も"
            
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

            //testing button
            changeLevel = UIButton()
                changeLevel.backgroundColor = UIColor.red
                changeLevel.layer.borderColor = UIColor(white: 0, alpha: 0.5).cgColor
                changeLevel.layer.borderWidth = 04
                changeLevel.layer.cornerRadius = 4
                changeLevel.setTitle("N1", for: .normal)
                changeLevel.translatesAutoresizingMaskIntoConstraints = false
                //need to make input button with objc func
                changeLevel.addTarget(self, action: #selector(changeNLevel), for: .touchUpInside)//remember this allows the button to be touched and then causes the action to happen.
                view.addSubview(changeLevel)


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

                changeLevel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 25),
                changeLevel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
                changeLevel.widthAnchor.constraint(equalToConstant: 50),
                changeLevel.heightAnchor.constraint(equalToConstant: 50),

                continueButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -60),
                continueButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -150),
                continueButton.widthAnchor.constraint(equalToConstant: 120),
                continueButton.heightAnchor.constraint(equalToConstant: 60),
                // continueButton.leadingAnchor.constraint(equalTo: inputButton.trailingAnchor),

                englishTranslationBox.widthAnchor.constraint(equalToConstant: 300),
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




//                let defaults = UserDefaults.standard
//
//                let savedArray = defaults.data(forKey: "SavedArray")
//                print(savedArray as Any)

        }// moved from above into viewDidLoad instead

        loadView()


        loadUI()

        save()
        //can't put save func below loadUI() as it doesn't save the first item in the array.

//        let defaults = UserDefaults.standard
//
//        //let savedData = pictureViewCount
//
//        if let savedViewCount = defaults.value(forKey: "picVC") as? Int {
//
//        //pictureViewCount += 1
//        print("savedValue: \(savedViewCount + 1)")
//
//            let defaults = UserDefaults.standard
//
//            let savedArray = defaults.object(forKey: "SavedArray") as? [String] ?? [String]()
//            print(savedArray)
//
//            if let dataCall = defaults.object(forKey: "picVC") as? [String] {
//
//                let jsonDecoder = JSONDecoder()
//                do {
//
//                    _ = try jsonDecoder.decode([Vocab].self, from: dataCall)
//
//
//                } catch {
//                    print(error)
//                }
//
//            }


            }

    @objc func changeNLevel(_sender: String) {
        switch _sender {
        case "N1":
            loadUI()
        case "N2":
            loadN2UI()

        default:
            print(Error.self)
        }


}


    func loadUI() {

//New problem with loading UI from TableView controller. Using Optional Chaining (answerBox?.text)prevents crashes when trying to select the optionals below. Which is a step in the right direction at least.
//
//        UILabel.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: [], animations: {

        answerBox?.text = vocabInfo.getVocab()
            answerBox?.fadeTransition(0.2)
        
        
        //Is showing the vocab but not in a box...
            englishTranslationBox?.text = vocabInfo.getEnglishTranslation()

            hiraganaBox?.textColor = .white// this is keeping the hiragana hidden. Now need to work on the loop to keep it hidden for 3 attempts

            hiraganaBox?.text = vocabInfo.getHiragana()
        //hideHiragana()

        //vocabInfo.testVocab[Vocab.AccessCounter<T>]
       // print (increment.pictureViewCountNew)
        viewCountBox?.text = ("View Count: \(vocabInfo.getNoOfTimes())")
        //partial application of mutating func is not allowed because missing parens.()

       // let items = vocabRetrieved.testVocab

        //for item in vocabRetrieved.testVocab {
           // picViewCount[(pictureViewCount)] += 1
        //pictureViewCount += 1
        save()
       // }
        //save()
//        wordViewCount += 1
         //can't put view count here.
//        save()
       // vocabRetrieved.testVocab[vocabInfo.getVocab()]
        //("\(pictureViewCount)")
            rightWrongAnswerBox?.text = "Try and Remember!"
            rightWrongAnswerBox?.textColor = .black

//            pictureViewCount += 1
//            save()


        }

    func loadN2UI() {

    }



    func submit(answer: String) {


        if answerAttemptCount < 3 {
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
            //view.reloadInputViews()
        } else if hiraganaBox.text != answer {
            let ac = UIAlertController(title: "Incorrect!", message: "Give it another go.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
             present(ac, animated: true)
            rightWrongAnswerBox.text = "Incorrect"
            rightWrongAnswerBox.textColor = .red
            answerAttemptCount += 1
            print(answerAttemptCount)
            //print("Incorrect")
        }


    } else if hiraganaBox.text != answer || answerAttemptCount == 4 {
        let ac = UIAlertController(title: "Show Answer?", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: showHiragana(_:)))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
        answerAttemptCount = 0
    } // the handler having no internal param name so we can use the showHiragana func here and also its SUPER important to set the function's sender to a UIALERTACTION not a button or a string.

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
            //self.answerAttemptCount += 1

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
//       var views = vocabInfo.getNoOfTimes() + 1
//        func add(views: Int) {
//        views + 1
//        }
//        print(add(views: 1))

//        for _ in 1...10 {
//            print(views + 1)

           // } this just printed the views 10 times.
    loadUI()


}

    func showHiragana(_ sender: UIAlertAction) {
        hiraganaBox.textColor = .black
    }

    func save(){


//        let defaults = UserDefaults.standard
//        defaults.setValue(pictureViewCount, forKey: "pictureViewCount")
//
//        if let savedViewCount = defaults.value(forKey: "pictureViewCount") as? Int {
//            print("saved value: \(savedViewCount)")
//        }
//        let defaults = UserDefaults.standard
//
//        let data = vocabInfo.testVocab
//        defaults.set(data, forKey: "SavedArray")
//
        //let jsonEncoder = JSONEncoder()

        //if let saveNumber = try?jsonEncoder.encode(pictureViewCount) { //Instance member 'encode' cannot be used on type 'JSONEncoder'; did you mean to use a value of this type instead? should have been the actual constant jsonEncoder
           // let savedWord = try?jsonEncoder.encode(vocabInfo.getVocab())
            // doesn't need to be an if let don't need to unwrap anything.
//        do {
//
//        //try to save the multiple records
//            let jsonEncoder = JSONEncoder()
//            let vocabViews = vocabInfo.testVocab
//        let data = try jsonEncoder.encode(vocabViews)
//            UserDefaults.standard.setValue(data, forKey: "picVC")
//
//          } catch {
//            print(error)
//
//        }



//        let defaults = UserDefaults.standard
//        let savedData = pictureViewCount
//
//        defaults.setValue(savedData, forKey: "picVC")


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


extension UIView {
    func fadeTransition(_ duration: CFTimeInterval) {// needs param to handle duration CFTimeInterval reprents time in seconds.
        let animation = CATransition()// saw this before in searching for how to use Core Animation to fade in words.
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        //timingFunc defines the pace, CAMediaTimingFunc is a class that defines the pacing of an animation as a timing curve
        animation.type = CATransitionType.push
        //so CATransitionType has a lot of ways to transition after it using dot notation. .fade allows it to fade words in. .reveal, slides the UILabel out like a card. currently .push allows the card to come in from the left and leave the screen on the right.
        animation.duration = duration
        layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
// this solution from stack overflow is awesome! Now the views transition with a fade in using this ext!!

}
