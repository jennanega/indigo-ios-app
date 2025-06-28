//
//  DocumentVC.swift
//  FinalProject
//
//  Created by Jenna Nega on 11/19/24.
//

import UIKit
import FirebaseAuth
import SwiftUI

public let information = [
    "\tWhat is the Indigo Collective: A tight-knit community that produces creative work under a universally-applicable collective theme.\n\n\tPurpose: To educate over lesser-known topics from a variety of angles under the theme, to foster inspiration, care, and awareness to the public, to reduce barriers for access and production of creative work, to build dedicated networking opportunities for the broader community, to carve a space that takes care of each other and equitably provides a safe place for expression.\n\n\tGoals: Provide support and some amount of funding to a yield of {X} projects started in the collective. Work out collaborative partnerships with various organizations, businesses, and firms to build continuous funding and services for our collective members to use. Accept all potential and interested candidates who exhibit they would be a best-fit for the collective. Use our non-profit as outreach and build opportunities for Austin-non-UT creatives to participate in the work the collective does. Provide future employment opportunities to creatives broadly through the non-profit to support and foster an environment where it is possible to follow creative passions in the midst of an environment that devalues creative work Produce creative work under the organization that deviates away from commoditization and focuses on its meaning and intentionality. Build accountability measures in place through our Resolution and Compliance branches. Each member will be seen as equal to each other, regardless of the work they do.",
    
    "\n\tThe collective will have two branches, Logistics, and Resolution and Compliance. A member in one of these branches cannot be a member of the other branch to avoid conflicts of interest.\n\n\tLogistics: Responsible for the functioning of the organization. Takes care of background procedural work in regards to budgeting, marketing, working with community members/external organizations, and providing production support to projects.There will be a position called “Collective Organizer”, which is solely responsible for the coordination of the branch and initiating tasks.In any event a policy or action done by logistics is investigated by Resolution and Compliance, the final decision by R&C will be binding.\n\n\tResolution and Compliance: Responsible for resolving disputes inside of the organization.This branch will be responsible for reviewing policies, complying with relevant policies in the event of notification, and any and all reports made to the organization. For every and all reports, a proper investigation will take place. Assignment of investigators (members of the branch) will attempt to choose non-conflicting members. There will be a position called “Lead Adjudicator”, which is responsible for coordinating the branch and making final resolutions in the event a dispute was appealed with sufficient reason and evidence. In a more serious event, it will defer investigation and decisions to outside governing agencies accordingly, and a determination made will be the recommendation the branch uses for its own decision.",
    
    "\tWhy “Indigo”: Indigo, as a crop, required millions of brown laborers and slaves across numerous continents that caused a huge portion of malignant health conditions and displaced millions through the effects of colonialism and the Atlantic slave trade. Nowadays, metaphors/imagery of “indigo” (or what we term more closely to ‘blue’) appear visibly and in-visibly in our day-to-day lives, such as the production of jeans/clothing with synthetic indigo, missile weapon programs being coined after the term, and the excess of synthetic indigo now causing damage to local ecosystems. I hope to envision the collection juxtaposing a lot of images/semblance to the damaging effects of indigo, as well as to emphasize the subjectivity of modern racialized creativity not compared by their individual merits, but collectively over what “Indigo resistance” looks like centuries later.\n\n\tHere is a sample of topics that indigo covers, not exhaustive: Middle Passages, Indigo Colonialism in the Americas, Europe, Asia, and Australia.\n\n\tEnvironment: Synthetic Indigo, Health\n\n\t“Stained images”: Warfare, New forms of resistance \n\n\tFashion: Jeans, Clothes landfills\n\n\tThe point of theme is to encourage exploration of the topic of indigo colonialism, interpret what indigo means for your identity/subjectivity, reach the margins of what could be assuaged from the theme, and to build a very universal common point to share and make sense of each others pains without the need to individualize unique and parallel struggles."
    ]

class DocumentVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    let textCellIndentifier = "textCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    // takes u to the other view controllers
    @IBAction func switchSegment(_ sender: Any) {
        switch segmented.selectedSegmentIndex {
            case 0:
                print("DocumentVC")
            case 1:
                performSegue(withIdentifier: "projectSegue", sender: self)
            // "segues" to a swiftUI VC
            case 2:
            let settingsView = SettingVC()  // Instance of the swiftUI controller
            let hostingController = UIHostingController(rootView: settingsView)
            hostingController.modalPresentationStyle = .fullScreen
            // makes the VC have the back bar
            navigationController?.pushViewController(hostingController, animated: true)
            default:
                break
        }
    }
    
    
    @IBAction func logOff(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.dismiss(animated: true)
        } catch {
            print("Sign out error")
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Deselect the row with animation
            tableView.deselectRow(at: indexPath, animated: true)
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIndentifier, for: indexPath)
        //label is replaced with team i
        let row = indexPath.row
        cell.textLabel?.text = information[row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 750
    }
}
