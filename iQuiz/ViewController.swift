//
//  ViewController.swift
//  iQuiz
//
//  Created by Liuqing Ma on 10/28/18.
//  Copyright © 2018 Liuqing Ma. All rights reserved.
//

import UIKit

struct Quiz: Codable{
    let title: String
    let desc: String
    let questions: [Question]
}

struct Question: Codable{
    let text: String
    let answer: String
    let answers: [String]
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var urlTextField: UITextField = UITextField()
    let defaults = UserDefaults.standard
    var jsonData: [Quiz]? = nil
    var titles: [String] = []
    var descriptions: [String] = []
    var elements: [String] = ["art", "science", "music"]
    var jsonUrlString: String = UserDefaults.standard.string(forKey: "url") ?? "https://gist.githubusercontent.com/monicapharm/55586a739041bb57aa93e2e431f93416/raw/14018773758f0f73b1bfab8c8f3a2f50c8f7c422/quizContent.json"
    // can also try "http://tednewardsandbox.site44.com/questions.json"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonData?.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! QuizTableViewCell
        cell.quizDescription.text = jsonData?[indexPath.row].desc
        cell.quizTitle.text = jsonData?[indexPath.row].title
        cell.quizTitle.font = UIFont.boldSystemFont(ofSize: 18.0)
        cell.quizImage.image = UIImage(named: "default")
        //check if title has icon if not use default.
        for  i  in 0...elements.count-1{
            if((cell.quizTitle.text?.lowercased().range(of: elements[i])) != nil){
                cell.quizImage.image = UIImage(named: elements[i])
            }
        }
        
        return cell
    }
    

    @IBAction func settings(_ sender: Any) {
        let uiAlert = UIAlertController(title: "Settings", message: "Enter a JSON URL", preferredStyle: .alert)
        uiAlert.addTextField {(textField: UITextField) in
            self.urlTextField = textField
            self.urlTextField.placeholder = "Enter url here"
        }
        uiAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        uiAlert.addAction(UIAlertAction(title: "Check now", style: .default, handler:{
            (act: UIAlertAction) in
            if((self.urlTextField.text) != nil){
                self.fetchJson(self.urlTextField.text!)
            }
        }))
        self.present(uiAlert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueGoToQuestion", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        if((defaults.object(forKey: "url")) != nil){
            self.jsonUrlString = defaults.object(forKey: "url") as! String
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(Reachability.isConnectedToNetwork()){
            if(jsonData == nil){
                fetchJson(jsonUrlString)
            }
        }else{
            let alert = UIAlertController(title: "No Internet", message: "Using local data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print("no internet, grabbing from user default");
            let anyData = defaults.object(forKey: "quizData")
            if(anyData == nil){
                let alert = UIAlertController(title: "No Local Data", message: "Please connect to internet", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                let data = anyData as! Data
                do{
                    let questions = try JSONDecoder().decode([Quiz].self, from: data)
                    self.jsonData = questions
                    for q in questions{
                        self.titles.append(q.title)
                        self.descriptions.append(q.desc)
                    }
                }catch{
                    self.failDownloadAlert()
                }
                self.tableView.reloadData()
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow{
            let categoryIndex = indexPath.row
            let questionView = segue.destination as! QAViewController
            questionView.jsonData = jsonData
            questionView.categoryIndex = categoryIndex
        }
    }
    
    func fetchJson(_ fetchUrl: String){
        guard let url = URL(string: fetchUrl) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {
                self.failDownloadAlert()
                return
            }
            self.defaults.set(fetchUrl, forKey: "url")
            self.defaults.set(data, forKey:"quizData")
            do{
                let questions = try JSONDecoder().decode([Quiz].self, from: data)
                self.jsonData = questions
                print(questions)
                for q in questions{
                    self.titles.append(q.title)
                    self.descriptions.append(q.desc)
                }
            }catch{
                self.failDownloadAlert()
            }
            
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
            }.resume()
    }
    
    func failDownloadAlert(){
        let alert = UIAlertController(title: "Download Failed", message: "Please check internet/ data URL/ data format", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

