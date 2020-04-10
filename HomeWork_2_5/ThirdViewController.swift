import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func buttonPressed(_ sender: Any) {
        let startDate = Date()
        let number = Int(textField.text!)
        DispatchQueue.global(qos: .utility).async {
            self.printPrimes(number!)
            print((String(format: "%.2f",(Date().timeIntervalSince(startDate)))))
        }
    }
    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 } || number == 1
    }
    func printPrimes(_ number: Int?){
        guard let number = number else { return }
        for i in 0 ..< number {
            if isPrime(i) {
                print(i)
            }
        }
    }
}
