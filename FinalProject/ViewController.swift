//  ViewController.swift
// Project: FinalProject
// EID: jn29322
// Course: CS329E
import UIKit
import FirebaseAuth
import FirebaseCore
import CoreData
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = UIImage(named:"indigo")
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.badge,.alert,.sound]) { (granted, error) in
                if granted {
                    print("We good!")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        Auth.auth().addStateDidChangeListener() {
            (auth, user) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                self.emailField.text = nil
                self.passField.text = nil
            }
        }
    }

    @IBAction func signIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailField.text!, password: passField.text!) {
            (authResult,error) in
            if let error = error as NSError? {
                let controller = UIAlertController(title: "Sign In Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
                controller.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(controller, animated: true)
            } else {
                let content = UNMutableNotificationContent()
                content.title = "Indigo Online Security Alert"
                content.subtitle = "New sign-in detected on iPhone."
                content.body = "If this was you, you don't need to do anything."
                content.sound = .default
                // create trigger
                let trigger = UNTimeIntervalNotificationTrigger(
                    timeInterval: 8,
                    repeats: false)
                // combine it all into a request
                let request = UNNotificationRequest(
                    identifier: "myNotification",
                    content: content,
                    trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailField.text!, password: passField.text!) {
            (authResult, error) in
            if let error = error as NSError? {
                let controller = UIAlertController(title: "Sign Up Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
                controller.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(controller, animated: true)
            }
        }
    }
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // Called when the user clicks on the view outside of the UITextField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
}

