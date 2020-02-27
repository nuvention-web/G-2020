//
//  FeedTableViewController.swift
//  WeFit_storyboard
//
//  Created by Cristina Barclay on 2/25/20.
//  Copyright © 2020 Cristina Barclay. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    
    //MARK: Properties
     
    var people = [Feed]()
    
    //MARK: Private Methods
     
    private func loadProfilepics() {
        let photo1 = UIImage(named: "pp1")!
        let photo2 = UIImage(named: "pp2")!
        
        let badge = UIImage(named: "badge")!
        let check = UIImage(named: "check")!
        let flame = UIImage(named: "flame")!
       
        
        guard let person1 = Feed(name: "Sara F.", photo: photo1, goal: "Ran 5 miles", completion: check, badge: badge, goalicon: flame, goaldescrip: "10 days") else {
            fatalError("Unable to instantiate person1")
        }

        guard let person2 = Feed(name: "Alex S.", photo: photo2, goal: "Did 50 pushups", completion: check, badge: badge, goalicon: flame, goaldescrip: "7 days") else {
            fatalError("Unable to instantiate person2")
        }

      

        people += [person1, person2]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       // Load the sample data.
        loadProfilepics()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "FeedTableViewCell"
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? FeedTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let person = people[indexPath.row]
        
        cell.ProfileName.text = person.name
        cell.ProfilePic.image = person.photo
        cell.Goal.text = person.goal
        cell.Completion.image = person.completion
        cell.GoalIcon.image = person.goalicon
        cell.GoalDescrip.text = person.goaldescrip
        cell.Badge.image = person.badge

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
