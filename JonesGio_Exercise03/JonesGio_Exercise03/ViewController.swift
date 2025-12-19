// Name: Gio Jones
// Class: iOS Development I - Online
//  ViewController.swift
//  JonesGio_Exercise03
//
//  Created by Gio on 11/19/25.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject
{
    func didReduceStrings(reducedString: String)
}

class ViewController: UIViewController, UITextFieldDelegate, SecondViewControllerDelegate{
    
    @IBOutlet var textFields: [UITextField]!
    @IBOutlet var label: UILabel!
    @IBOutlet weak var secondViewButton: UIButton?
    
    let sampleData: [String] = ["Hello", "World", "!"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Loop through textfields
        for textField in textFields
        {
            textField.delegate = self
            //set return key to 'next'
            textField.returnKeyType = .next
        }
        
        //Set last return key to done
        textFields.last?.returnKeyType = .done
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ToSecondViewController", let vc = segue.destination as? SecondViewController
        {
            var allTextFieldStrings: [String] = []
            for textField in textFields
            {
                if let text = textField.text, !text.isEmpty
                {
                    allTextFieldStrings.append(text)
                } else {
                    allTextFieldStrings.append("")
                }
            }
            vc.delegate = self
            //Placeholder to figure out to get the textfield values to display in the SecondViewController labels
            vc.recievedStrings = allTextFieldStrings
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if let currentIndex = textFields.firstIndex(of: textField)
        {
            if currentIndex < textFields.count - 1
            {
                textFields[currentIndex + 1].becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        }
        return false
    }
    
    func didReduceStrings(reducedString: String) {
        label.text = "Reduced String: \(reducedString)"
    }
}
