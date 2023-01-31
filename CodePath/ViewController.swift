//
//  ViewController.swift
//  CodePath
//
//  Created by Faye Alangi on 1/4/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var morePetsSwitch : UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    @IBOutlet weak var yearSegmentedControl:
    UISegmentedControl!
    @IBOutlet weak var colorSegmentedControl :UISegmentedControl!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
    }
    @IBAction func stepperDidChange(_ sender: UIStepper){
        numberOfPetsLabel.text="\(Int(sender.value))"
    }
    @IBAction func colorSegmentDidChange(_ sender:UISegmentedControl){
        let background_color=colorSegmentedControl.titleForSegment(at: colorSegmentedControl.selectedSegmentIndex)
        switch background_color!{
        case "Yellow":
            self.view.backgroundColor = UIColor(hue: 0.1333, saturation: 0.32, brightness: 1, alpha: 1.0)
        case "Green":
            self.view.backgroundColor = UIColor(hue: 0.275, saturation: 0.12, brightness: 0.97, alpha: 1.0)
        case "Blue":
            self.view.backgroundColor = UIColor(hue: 0.5833, saturation: 0.23, brightness: 1, alpha: 1.0)
        case "Reset":
            self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        default:
            self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        }
    }
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
          
          // Let's us chose the title we have selected from the segmented control
          let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
          
          // Creating a variable of type string, that holds an introduction. The introduction interpolates the values from the text fields provided.
          // Currently we can only present the information in a print statement. However, this lets us verify that our app is printing out what is intended!
       
        var petInfo=""
        switch numberOfPetsLabel.text{
        case "0":
            petInfo = "no pet"
        case "1":
            petInfo = numberOfPetsLabel.text! + " pet"
        default:
            petInfo = numberOfPetsLabel.text! + " pets"
        }
        var wantMorePets=""
        if morePetsSwitch.isOn{
            if numberOfPetsLabel.text! != "0"{
                wantMorePets = "I love to have more pets!"}
            else{
                wantMorePets = "I love to have a pet one day!"
            }
        }else{
            if numberOfPetsLabel.text! != "0"{
                wantMorePets = "No more pets for me!"}
            else{
                wantMorePets = "I am not a pet person!"}
        }
    
          let introduction = "My name is \(firstNameTextField.text!) \(lastNameTextField.text!) and I attend \(schoolNameTextField.text!). I am currently in my \(year!) year and I own \(petInfo). \(wantMorePets)"
          
          // Creates the alert where we pass in our message, which our introduction.
          let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
          
          // A way to dismiss the box once it pops up
          let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
          
          // Passing this action to the alert controller so it can be dismissed
          alertController.addAction(action)
          
          present(alertController, animated: true, completion: nil)
      }
    
    

}

