import UIKit
import CoreImage

class SecondViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let urlString = "https://cdn1.flamp.ru/30aa645d233ebd2aa124cfc8207e55b8.jpg"
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func loadPressed(_ sender: Any) {
        DispatchQueue.global(qos: .utility).async {
            let url = URL(string: self.urlString)
            let data = try? Data(contentsOf: url!)
            let image = UIImage(data: data!)
            DispatchQueue.main.async {
                self.imageView.image = image
                self.imageView.addBlurEffect()
            }

        }
    }
}

extension UIImageView {

    func addBlurEffect(){
        let effect = UIBlurEffect(style: .dark)
        let effectView = UIVisualEffectView(effect: effect)
        effectView.frame = self.bounds
        effectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        effectView.alpha = 0
        self.addSubview(effectView)
        UIView.animate(withDuration: 2) {
            effectView.alpha = 1
        }
    }
}
