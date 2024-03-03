//
//  ViewController.swift
//  Student
//
//  Created by Ahmad Musallam on 03/03/2024.
//

import UIKit

class ViewController: UITableViewController {
    
    var student: [Student] = [Student(name: "Ahmad", GPA: 3.38, profileImage: "Profile"),Student(name: "Wahab", GPA: 3.50, profileImage: "Profile2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath )
        
        
        let student = student[indexPath.row]
        
        cell.textLabel?.text = "Name: \(student.name) GPA: \(student.GPA) "
        cell.imageView?.image = UIImage(named:student.profileImage)
        
        // return
        return cell
        
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Deselect the row for visual feedback
        tableView.deselectRow(at: indexPath, animated: true)

        // Create an instance of DetailAccountViewController
        let detailVC = DetailViewController()

        // Pass the selected bank account to the detail view controller
        let selectedAccount = student[indexPath.row]
        detailVC.student = selectedAccount

        // Navigate to DetailAccountViewController
        navigationController?.pushViewController(detailVC, animated: true)
    }

}
