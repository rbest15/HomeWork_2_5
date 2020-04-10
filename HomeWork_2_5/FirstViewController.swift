import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let urlString = "https://cdn1.flamp.ru/30aa645d233ebd2aa124cfc8207e55b8.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func loadPress(_ sender: Any) {
        DispatchQueue.global(qos: .utility).async {
            let url = URL(string: self.urlString)
            let data = try? Data(contentsOf: url!)
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
}
