//
//  ViewController.swift
//  twotableviews
//
//  Created by Cristina Barclay on 3/2/20.
//  Copyright © 2020 Cristina Barclay. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ref:DatabaseReference?
    var databaseHandle:DatabaseHandle?
   
    @IBOutlet weak var feed: UITableView!
    
    @IBOutlet weak var post: UITableView!
    
    var postData = [Post]()
    
    var feedData = [Feed]()
    
    //MARK: Private Methods
     
    private func loadProfilepics(id: String, name: String = "", goal: String = "", numberOfLikes: Int = 0, hasLiked: Bool = false) {
        let photo1 = UIImage(named: "pp1")!
        let photo2 = UIImage(named: "pp2")!
        let photo3 = UIImage(named: "pp3")!
        let check = UIImage(named: "check")!
        let failed = UIImage(named: "failed")!
        
        if (name == "Sara F.") {
           guard let person1 = Feed(id: id, name: name, photo: photo1, goal: goal, completion: check, numberOfLikes: numberOfLikes, hasLiked: hasLiked) else {
                fatalError("Unable to instantiate person1")
            }
            feedData.append(person1)
        }
       
        else if (name == "Alex S.") {
            guard let person2 = Feed(id: id, name: name, photo: photo2, goal: goal, completion: check, numberOfLikes: numberOfLikes, hasLiked: hasLiked) else {
                fatalError("Unable to instantiate person1")
            }
            feedData.append(person2)
        }
        else if (name == "John Z.") {
            guard let person3 = Feed(id: id, name: name, photo: photo3, goal: goal, completion: check, numberOfLikes: numberOfLikes, hasLiked: hasLiked) else {
                fatalError("Unable to instantiate person1")
            }
            feedData.append(person3)
        }
        
    }
    
    private func loadProfilepicsUpdate(id: String, name: String = "", goal: String = "", numberOfLikes: Int = 0, hasLiked: Bool = false) {
            let check = UIImage(named: "check")!

            
        for i in feedData.indices {
            if feedData[i].id == id {
                guard let person1 = Feed(id: id, name: name, photo: feedData[i].photo, goal: goal, completion: check, numberOfLikes: numberOfLikes, hasLiked: hasLiked) else {
                    fatalError("Unable to instantiate person1")
                }
                feedData[i] = person1
            }
        }
            
    }
    
    private func loadPost(){
        guard let post1 = Post(title: "My Challenges") else{
            fatalError("Unable")
        }
        
        postData += [post1]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPost()
        post.delegate = self
        feed.delegate = self
        post.dataSource = self
        feed.dataSource = self
        ref = Database.database().reference()
//        guard let key = ref!.child("users").childByAutoId().key else {return}
//        let reference = ref?.child("users/\(key)").setValue(["name":"Bobert", "goal":"Do 50 pushups", "completion": true, "hasLiked": false, "numberOfLikes": 0])
        
        databaseHandle = ref?.child("users").observe(.childAdded, with: { (DataSnapshot) in

            let postDict = DataSnapshot.value as? NSDictionary
            let id = DataSnapshot.key
            let goal = postDict?["goal"] as? String
            let completion = postDict?["completion"] as? Bool
            let hasLiked = postDict?["hasLiked"] as? Bool
            let name = postDict?["name"] as? String
            let numberOfLikes = postDict?["numberOfLikes"] as? Int
            self.loadProfilepics(id: id, name: name ?? "", goal: goal ?? "", numberOfLikes: numberOfLikes ?? 0, hasLiked: hasLiked ?? false)
            self.feed.reloadData()
        })
        
        databaseHandle = ref?.child("users").observe(.childChanged, with: { (DataSnapshot) in
            let postDict = DataSnapshot.value as? NSDictionary
            let id = DataSnapshot.key
            let goal = postDict?["goal"] as? String
            let completion = postDict?["completion"] as? Bool
            let hasLiked = postDict?["hasLiked"] as? Bool
            let name = postDict?["name"] as? String
            let numberOfLikes = postDict?["numberOfLikes"] as? Int
            self.loadProfilepicsUpdate(id: id, name: name ?? "", goal: goal ?? "", numberOfLikes: numberOfLikes ?? 0, hasLiked: hasLiked ?? false)
            self.feed.reloadData()
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberofRows = 1
        switch tableView {
        case post:
            numberofRows = postData.count
        case feed:
            numberofRows = feedData.count
            // print(numberofRows)
        default:
            print("something is wrong")
        }
        return numberofRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     
        
        switch tableView {
        case post:
            
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as? PostTableViewCell  else {
                fatalError("The dequeued cell is not an instance of postTableViewCell.")
            }
          
            let post = postData[indexPath.row]
            
            cell.Title.text = post.title
            return cell
            
            
            
        case feed:
            
            
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedcell", for: indexPath) as? FeedTableViewCell  else {
                fatalError("The dequeued cell is not an instance of feedTableViewCell.")
            }
            cell.delegate = self
            let person = feedData[indexPath.row]
            
            cell.indexPath = indexPath
            cell.ProfileName.text = person.name
            cell.ProfilePic.image = person.photo
            cell.Goal.text = person.goal
            cell.Completion.image = person.completion
            cell.numberOfLikes.text = String( feedData[indexPath.row].numberOfLikes)
            cell.backgroundColor = UIColor.white
            return cell
            
        default:
            print("something is wrong")
        }
       return UITableViewCell()
        
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var size = CGFloat(100)
        switch tableView{
            case post:
                size = CGFloat(100)
            case feed:
                size = CGFloat(200)
            default:
                   print("something is wrong")
        }
        return size
    }


}

extension ViewController:FeedTableViewCellProtocol{
    func likeButtonTapped(indexPath:IndexPath) {
        ref = Database.database().reference()
        
        
        if (!self.feedData[indexPath.row].hasLiked) {
        ref!.child("users/\(self.feedData[indexPath.row].id)").updateChildValues(["numberOfLikes": self.feedData[indexPath.row].numberOfLikes + 1, "hasLiked": true])
        }
        else {
        ref!.child("users/\(self.feedData[indexPath.row].id)").updateChildValues(["numberOfLikes": self.feedData[indexPath.row].numberOfLikes - 1, "hasLiked": false])
        }
        self.feed.reloadData()
    }
}
