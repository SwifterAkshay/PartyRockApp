//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Akshay Thakare on 1/9/17.
//  Copyright © 2017 Akshay Thakare. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://www.wopvideos.com/imgthumbs/17337/img5.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/1w9DiGlZksU?list=PLtM4rw7sjPKUe0YW6Fmrp2FSU7RxkX-JA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")
        
        let p2 = PartyRock(imageURL: "https://i.ytimg.com/vi/SkTt9k4Y-a8/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/SkTt9k4Y-a8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Sorry For Party Rocking")
        
        let p3 = PartyRock(imageURL: "http://www.popcrush.com/files/2011/10/lmfao.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/wyx6JDQCslE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Sexy and I Know It")
        
        let p4 = PartyRock(imageURL: "https://i.ytimg.com/vi/UA8rcLvS1BY/maxresdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UA8rcLvS1BY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Champagne Showers")
        
        let p5 = PartyRock(imageURL: "https://upload.wikimedia.org/wikipedia/en/3/3f/Shots_LMFAO_song.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/XNtTEibFvlQ\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Shots")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
            
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            
            return cell
        } else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC{
            if let party = sender as? PartyRock{
                destination.partyRock = party
            }
        }
    }
}

