//
//  ProfileTableViewController.swift
//  Slice2WeFit
//
//  Created by Natalia Novoa on 2/25/20.
//  Copyright © 2020 Natalia Novoa. All rights reserved.
//

import UIKit

class RankTableViewController: UITableViewController {

    //MARK: Properties
     
    var people = [Rank]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSamplePeople()

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
        let cellIdentifier = "RankTableViewCell"
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RankTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        let person = people[indexPath.row]
        
        cell.name.text = person.name
        cell.photo.image = person.photo
        cell.streak.image = person.streak
        cell.days.text = person.days

        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
    
    //MARK: Private Methods
     
    private func loadSamplePeople() {
        let photo1 = UIImage(named: "person1")!
        let photo2 = UIImage(named: "person2")!
        let photo3 = UIImage(named: "person3")!
        let streak = UIImage(systemName: "flame.fill")!
        
        guard let person1 = Rank(name: "Sara F.", photo: photo1, streak: streak, days: "10") else {
            fatalError("Unable to instantiate person1")
        }

        guard let person2 = Rank(name: "Alex S.", photo: photo2, streak: streak, days: "5") else {
            fatalError("Unable to instantiate person1")
        }
        
        guard let person3 = Rank(name: "Jack F.", photo: photo3, streak: streak, days: "2") else {
            fatalError("Unable to instantiate person1")
        }

        people += [person1, person2, person3]
    }
    
}
