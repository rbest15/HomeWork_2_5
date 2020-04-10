import UIKit
import Bond
import ReactiveKit

class ViewController: UIViewController {
    @IBOutlet weak var taskTableView: UITableView!
    
    var taskArray = MutableObservableArray<String>(["1","2","3"])
    var disposBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskArray.bind(to: taskTableView) { (dataSource, indexPath, tableView) -> UITableViewCell in
            let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskTableViewCell
            cell.taskLabel.text = dataSource[indexPath.row]
            return cell
        }
        
        taskTableView.reactive.selectedRowIndexPath.observeNext { (index) in
            switch index.row {
            case 0:
                let vc = self.storyboard!.instantiateViewController(identifier: "firstVC") as! FirstViewController
                self.show(vc, sender: self)
            case 1:
                let vc = self.storyboard!.instantiateViewController(identifier: "secondVC") as! SecondViewController
                self.show(vc, sender: self)
            case 2:
                let vc = self.storyboard!.instantiateViewController(identifier: "thirdVC") as! ThirdViewController
                self.show(vc, sender: self)
            default:
                return
            }
        }.dispose(in: disposBag)
    }


}

