//
//  SecondViewController.swift
//  JonesGio_Exercise03
//
//  Created by Gio on 11/19/25.
//

import UIKit

class SecondViewController: UIViewController
{
    weak var delegate: SecondViewControllerDelegate?
    
    @IBOutlet var labels: [UILabel]!
    @IBOutlet weak var backButton: UIButton!
    
    var recievedStrings: [String] = []
    {
        didSet
        {
            if isViewLoaded
            {
                updateLabels()
            }
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateLabels()
    }
    
    func updateLabels()
    {
        for(index, string) in recievedStrings.enumerated()
        {
            labels[index].text = string
            labels[index].textAlignment = .center
        }
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton)
    {
        //Dismiss view without passing any data
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func reduceButtonTapped(_ sender: UIButton)
    {
        let reducedString = recievedStrings.reduce("") { result, string in
            
            return result + string
        }
        
        delegate?.didReduceStrings(reducedString: reducedString)
        
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
