import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var delegate: ViewControllerDelegate?
    var history = [Score]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        history = (delegate?.getHistory())!
        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.tableFooterView = UIView()
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let result = history [indexPath.row]
        cell.titleLabel.text = result.title
        cell.scoreLabel.text = "\(result.points!*10)%"
        return cell
    }
}
