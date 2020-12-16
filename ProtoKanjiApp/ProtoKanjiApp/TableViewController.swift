//
//  TableViewController.swift
//  ProtoKanjiApp
//
//  Created by Mohammed Qureshi on 2020/12/09.
//

//tried moving to main VC but would not load vc when N1 was selected... need to make a link between load() func and this table view cell...

//import UIKit
//
//class TableViewController: UITableViewController {
//
//    private let levelArray: NSArray = ["N1", "N2", "N3", "N4", "N5"]
//  private var levelTableView: UITableView!
//
//    override func viewDidLoad() {
//
//        title = "何回も"
//
//        navigationController?.navigationBar.prefersLargeTitles = true
//
//        navigationItem.largeTitleDisplayMode = .never
//       // let vocabAll = VocabBuilder()
////        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
////        let displayWidth: CGFloat = self.view.frame.width
////        let displayHeight: CGFloat = self.view.frame.height
////        levelTableView = UITableView(frame: CGRect(x: 0, y:barHeight, width: displayWidth, height: displayHeight - barHeight))
////        levelTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
////        levelTableView.dataSource = self
////        levelTableView.delegate = self
////        self.view.addSubview(levelTableView)
//
//    }
//    //var vocabN1 = VocabBuilder()
//
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return levelArray.count
//        }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            //levelArray[indexPath.row] as! UITableViewCell //force downcast the level array as a UITableViewCell?
//            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
//            cell.textLabel!.text = "\(levelArray[indexPath.row])"
//        //cell.contentView.addSubview(view)
//            return cell
//        }
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            if let vc = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? ViewController
//            {
//                
//              // let vocabAll = VocabBuilder()
//                //func getAll () -> String { return
//                //vc.loadView()
//                self.addChild(vc)
//                
//                vc.didMove(toParent: self)
//                    
//               // }
//            }
//        }
//r}
