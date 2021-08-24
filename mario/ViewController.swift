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
        print("fdbvf",games)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = gameTableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameCell
        cell.update(game: games[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

