//
//  CommitViewController.swift
//  Midterm
//
//

import Foundation
import UIKit

protocol CommitViewControllerDelegate: class {
    func showData(data: Movie)
}

class CommitViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate{
    weak var delegate: CommitViewControllerDelegate?
    var commitedMovie: Movie!
    var tag: Int!
    
    @IBOutlet weak var inputText: UITextView!
    @IBOutlet var RateStars: [UIButton]!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet var commitView: UIView!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var commitLabel: UILabel!
    @IBAction func saveRating(_ sender: UIButton) {
        self.delegate?.showData(data: commitedMovie)
//        let viewControllers: [UIViewController] = self.navigationController!.viewControllers
//        for aViewController in viewControllers {
//            if aViewController is DetailsViewController {
//                self.navigationController!.popToViewController(aViewController, animated: true)
//            }
//        }
        let newTextField =  UITextView(frame: CGRect(x: 20, y: (commitLabel.frame.origin.y + 56), width: 376, height: 45))
        newTextField.font = UIFont.systemFont(ofSize: 15)
        newTextField.autocorrectionType = UITextAutocorrectionType.no
        newTextField.keyboardType = UIKeyboardType.default
        newTextField.returnKeyType = UIReturnKeyType.done
        newTextField.isUserInteractionEnabled = false
        newTextField.delegate = self
        newTextField.backgroundColor =  commitLabel.textColor
        newTextField.textColor = UIColor.black
        newTextField.layer.cornerRadius = 4.0
        newTextField.text = inputText.text
        
            if (inputText.textColor == UIColor.black && tag != nil){
                self.view.addSubview(newTextField)
            }else{
                let alert = UIAlertController(title: "Incomplete Information", message: "Please enter a commit or rate the movie!", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func starTapped(_ sender: UIButton) {
        tag = sender.tag
        for button in RateStars{
            if button.tag <= tag{
                button.setTitle("★", for: .normal)
                button.titleLabel?.font = button.titleLabel?.font.withSize(50)
            }else{
                button.setTitle("☆", for: .normal)
            }
        }
        commitedMovie.rating = tag + 1
    }
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        submitButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        submitButton.layer.shadowOpacity = 1.0
        submitButton.layer.shadowRadius = 0.0
        submitButton.layer.masksToBounds = false
        submitButton.layer.cornerRadius = 4.0
        

        inputText.text = "Leave your commit here!"
        inputText.textColor = UIColor.lightGray
        inputText.delegate = self
        
        backImage.image = commitedMovie.image
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if inputText.textColor == UIColor.lightGray {
            inputText.text = nil
            inputText.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if inputText.text.isEmpty {
            inputText.text = "Leave your commit here!"
            inputText.textColor = UIColor.lightGray
        }
    }
    
}

