//
//  ViewController.swift
//  mario
//
//  Created by Ruel Lafuente on 8/22/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var gameTableView: UITableView!
    var games = [Game]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initController()
        loadAPI()
    }
    
    func initController() {
        gameTableView.delegate = self
        gameTableView.dataSource = self
        gameTableView.register(UINib(nibName: "GameCell", bundle: nil), forCellReuseIdentifier: "GameCell")
        gameTableView.tableFooterView = UIView()
    }
    
    func loadAPI() {
        Network.request(URLString: GlobalVariable.apiUrl) { success, response in
            if success! {
                let decoder = JSONDecoder()
                self.games.removeAll()
                if let thisGames = try? decoder.decode(GameList.self, from: response as! Data) {
                    for game in thisGames.amiibo {
                        self.games.append(game)
                    }
                    DispatchQueue.main.async {
                        self.gameTableView.reloadData()
                    }
                }
            }
        } failed: { failed, response in
            print("Failed",response as Any)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = gameTableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameCell
        let game = games[indexPath.row]
        cell.update(game:game )
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showWeb", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWeb" {
            let viewController = segue.destination as! WebController
            let selectedRow = sender as? Int
            viewController.gameSeries = games[selectedRow!].gameSeries
        }
    }
    
}

