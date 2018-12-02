//
//  DetailsViewController.swift
//  Midterm
//


import UIKit
protocol DetailsViewControllerDelegate: class {
    func showData(data: Movie, position: Int)
}

class DetailsViewController: UIViewController, CommitViewControllerDelegate {
    func showData(data: Movie) {
        self.movie.rating = data.rating
    }

    
    weak var delegate: DetailsViewControllerDelegate?
    var movie: Movie!
    var position: Int!
    
  
    @IBOutlet var trailer: UIWebView!
    @IBOutlet weak var movieDetail: UITextView!
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var rateButton: UIButton!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let movie = movie{
//            movieTitleLabel.text = ""
            backgroundImage.image = movie.image
            movieDetail.text = movie.description
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getVideo(videoCode: movie.trailer)
        
        rateButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        rateButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        rateButton.layer.shadowOpacity = 1.0
        rateButton.layer.shadowRadius = 0.0
        rateButton.layer.masksToBounds = false
        rateButton.layer.cornerRadius = 4.0
        
//        movieDetail.layer.backgroundColor = UIColor.lightGray.cgColor
    }
    
    func getVideo(videoCode:String)
    {
        
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        trailer.loadRequest(URLRequest(url: url!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidDisappear(_ animated: Bool){
        if (self.isMovingFromParentViewController) {
           self.delegate?.showData(data: movie, position: position)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "commitSeague"{
            let vcc = segue.destination as? CommitViewController
                vcc?.commitedMovie = self.movie
                vcc?.delegate = self
        }
    }

}
