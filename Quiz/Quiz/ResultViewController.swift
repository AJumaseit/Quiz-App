import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var gameDelegate: GameViewControllerDelegate?
    var mainDelegate: ViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateData()
    }
    
    func updateData() {
        resultLabel.text = "\((gameDelegate?.getScore() ?? 0)*10)%"
        mainDelegate?.setAttempt(gameDelegate?.getScore() ?? 0)
    }
    
    
    @IBAction func tryagainPressed(_ sender: Any) {
        gameDelegate?.refreshData()
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func homepagesPressed(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
