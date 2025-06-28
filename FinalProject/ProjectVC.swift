//
//  ProjectVC.swift
//  FinalProject
//
//  Created by Jenna Nega on 11/19/24.
//

import UIKit
public let projects = [
    "Indigo Undead Photoshoot", "Indigo Online App", "Creative Mentorship Program",
    "Speaker Series: South Asia Deconstructed","Creative Switch-Up","Induction Ceremony",
    "Los Kurado Music Video", "Adobe Provisioning", "Mobile Photoshoot Truck","Texas Bonfire"
    ]

class ProjectVC: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    let textCellIndentifier = "textCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Deselect the row with animation
            tableView.deselectRow(at: indexPath, animated: true)
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIndentifier, for: indexPath)
        //label is replaced with team i
        let row = indexPath.row
        cell.textLabel?.text = projects[row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
}
