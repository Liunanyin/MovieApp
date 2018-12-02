//
//  ViewController.swift
//  Midterm
//


import UIKit

enum Rating: String {
    case one = "⭐️"
    case two = "⭐️⭐️"
    case three = "⭐️⭐️⭐️"
    case four = "⭐️⭐️⭐️⭐️"
    case five = "⭐️⭐️⭐️⭐️⭐️"
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, DetailsViewControllerDelegate {
    
    func showData(data: Movie, position: Int){
        array.remove(at: position)
        array.insert(data, at: position)
        collectionView.reloadData()
    }
    
    var rate: String = ""
    @IBOutlet weak var sortButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!
    let reuseIdentifier = "cell"
    var array = [Movie]()
    var sortedArray = [Movie]()
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell

        cell.myImage.image = array[indexPath.item].image
        switch array[indexPath.item].rating {
        case 1:
            rate = Rating.one.rawValue
        case 2:
            rate = Rating.two.rawValue
        case 3:
            rate = Rating.three.rawValue
        case 4:
            rate = Rating.four.rawValue
        case 5:
            rate = Rating.five.rawValue
        default:
            rate = Rating.five.rawValue
        }
        cell.ratingLabel.text = rate
     
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 0
        cell.myImage.layer.borderWidth = 1
        cell.myImage.layer.cornerRadius = 8
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        array.append(Movie(name: "Titanic", year: 1997, description: "Titanic is a 1997 American epic romance-disaster film directed, written, co-produced and co-edited by James Cameron. A fictionalized account of the sinking of the RMS Titanic, it stars Leonardo DiCaprio and Kate Winslet as members of different social classes who fall in love aboard the ship during its ill-fated maiden voyage.", image: #imageLiteral(resourceName: "Titanic"), rating: 4, trailer: "2e-eXJ6HgkQ"))
        array.append(Movie(name: "Rampage", year: 2018, description: "ampage is a 2018 American science fiction monster film directed by Brad Peyton, and loosely based on the video game series of the same name by Midway Games. The film stars Dwayne Johnson, Naomie Harris, Malin Akerman, Jake Lacy, Joe Manganiello, and Jeffrey Dean Morgan. It follows a primatologist named Davis Okoye who must team up with George, an albino gorilla who turns into a raging creature of enormous size as a result of a rogue experiment, to stop two other mutated animals from destroying Chicago.", image: #imageLiteral(resourceName: "Rampage"), rating: 4, trailer: "coOKvrsmQiI"))
        array.append(Movie(name: "The Kingdom", year: 2007, description: "The Kingdom is a 2007 American action thriller film directed by Peter Berg and starring Jamie Foxx, Chris Cooper, and Jennifer Garner. The film is set in Saudi Arabia, and is loosely based on the 1996 bombing of the Khobar housing complex and the 2003 bombing of the Riyadh compound, During a softball game at an American oil company housing compound in Riyadh, Saudi Arabia, al-Qaeda terrorists set off a bomb, killing Americans and Saudis. A suicide bomber wearing a fake police uniform blows himself up, killing everyone near him.", image: #imageLiteral(resourceName: "TheKingdom"), rating: 3, trailer: "YsJXIqma56s"))
        array.append(Movie(name: "Pacfic Rim Uprising", year: 2018, description: "Pacific Rim Uprising is a 2018 American science fiction film directed by Steven S. DeKnight, and written by DeKnight, Emily Carmichael, Kira Snyder, and T.S. Nowlin. Guillermo del Toro, serving as a producer. The sequel stars John Boyega, as well as Scott Eastwood, Cailee Spaeny, Jing Tian, Adria Arjona, and Zhang Jin, with Rinko Kikuchi, Charlie Day, and Burn Gorman returning from the original film. Set in the year 2035, the plot follows humanity again fighting Kaiju, the giant monsters set on destroying the world.", image: #imageLiteral(resourceName: "Pacificrim"), rating: 5, trailer: "cqQwy_Q7C_s"))
        array.append(Movie(name: "Divergent", year: 2014, description: "Divergent is a 2014 American dystopian science fiction action film directed by Neil Burger, based on the novel of the same name by Veronica Roth. The film is the first installment in The Divergent Series and was produced by Lucy Fisher, Pouya Shabazian, with a screenplay by Evan Daugherty and Vanessa Taylor. Beatrice Prior is warned that she is Divergent and thus will never fit into any one of the factions. She soon learns that a sinister plot is brewing in the seemingly perfect society.", image: #imageLiteral(resourceName: "Divergent"), rating: 3, trailer: "336qJITnDi0"))
        array.append(Movie(name: "Guardians of the Galaxy Vol.2", year: 2017, description: "Guardians of the Galaxy Vol. 2 is a 2017 American superhero film based on the Marvel Comics superhero team Guardians of the Galaxy. Written and directed by James Gunn, the film stars an ensemble cast featuring Chris Pratt, Zoe Saldana, Dave Bautista, Vin Diesel, Bradley Cooper, Michael Rooker, Karen Gillan, Pom Klementieff, Elizabeth Debicki, Chris Sullivan, Sean Gunn, Sylvester Stallone, and Kurt Russell. In Guardians of the Galaxy Vol. 2, the Guardians travel throughout the cosmos as they help Peter Quill learn more about his mysterious parentage.", image: #imageLiteral(resourceName: "GuardiansOfGalaxy"), rating: 5, trailer: "26BCLJ9QjHc"))
        array.append(Movie(name: "The Crimes of Grindelwald", year: 2018, description: "The Crimes of Grindelwald is a 2018 fantasy film directed by David Yates and written by J. K. Rowling. The film features an ensemble cast that includes Eddie Redmayne, Katherine Waterston, Dan Fogler, Alison Sudol, Ezra Miller, Zoë Kravitz, Callum Turner, Claudia Kim, William Nadylam, Kevin Guthrie, Jude Law, and Johnny Depp. The plot follows Newt Scamander and Albus Dumbledore as they attempt to take down the dark wizard Gellert Grindelwald, while facing new threats in a more divided wizarding world.", image: #imageLiteral(resourceName: "The Crimes of Grindelwald"), rating: 5, trailer: "vvFybpmyB9E"))
        array.append(Movie(name: "Wonder Woman", year: 2017, description: "Wonder Woman is a 2017 American superhero film based on the DC Comics character of the same name, distributed by Warner Bros. Pictures.  Directed by Patty Jenkins from a story by Heinberg, Zack Snyder, and Jason Fuchs, the film stars Gal Gadot in the title role alongside Chris Pine, Robin Wright, Danny Huston, David Thewlis, Saïd Taghmaoui, Connie Nielsen, and Elena Anaya. In Wonder Woman, the Amazon princess Diana sets out to stop World War I, believing the conflict was started by the Amazons' longtime enemy Ares, after American pilot and spy Steve Trevor crash-lands on their island Themyscira and informs her about it.", image: #imageLiteral(resourceName: "WonderWoman"), rating: 5, trailer: "95a2aqEAbo8"))
        array.append(Movie(name: "The Legend of Tarzan", year: 2016, description: "The Legend of Tarzan is a 2016 adventure film based on the fictional character created by Edgar Rice Burroughs. Directed by David Yates, with a screenplay by Adam Cozad and Craig Brewer,[4] the film stars Alexander Skarsgård as the title character, with Samuel L. Jackson, Margot Robbie, Djimon Hounsou, Jim Broadbent and Christoph Waltz in supporting roles. Principal photography began on June 21, 2014, at Warner Bros. Leavesden Studios in the United Kingdom and wrapped four months later on October 3.", image: #imageLiteral(resourceName: "Tarzan"), rating: 4, trailer: "aA9eTnJS03s"))

        
    }
    
    @IBAction func sort(_ sender: Any) {
        
        let arrayLength = array.count
        for index in 0...(arrayLength-1) {
            if(array[index].rating == 5){
                sortedArray.append(array[index])
            }
        }
        for index in 0...(arrayLength-1) {
            if(array[index].rating == 4){
                sortedArray.append(array[index])
            }
        }
        for index in 0...(arrayLength-1) {
            if(array[index].rating == 3){
                sortedArray.append(array[index])
            }
        }
        for index in 0...(arrayLength-1) {
            if(array[index].rating == 2){
                sortedArray.append(array[index])
            }
        }
        for index in 0...(arrayLength-1) {
            if(array[index].rating == 1){
                sortedArray.append(array[index])
            }
        }
        array.removeAll()
        array.append(contentsOf: sortedArray)
        sortedArray.removeAll()
        collectionView.reloadData()
    }

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            let vc = segue.destination as? DetailsViewController
            if let indexPath = collectionView.indexPathsForSelectedItems {
                vc?.movie = array[((indexPath.first)?.row)!]
                vc?.position = ((indexPath.first)?.row)!
                vc?.delegate = self
            }
            
        }
    }
    
    
}


