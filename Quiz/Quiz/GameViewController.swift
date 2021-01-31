import UIKit

protocol GameViewControllerDelegate {
    func getScore()->Int
    func refreshData()
}

class GameViewController: UIViewController {
    
    var delegate: ViewControllerDelegate?
    var game: [Quiz] = []
    var id = 0
    var points = 0

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        game = (delegate?.getGame())!
        refreshData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateData()
    }
    
    func updateData() {
        let q = game[id]
        questionLabel.text = q.question
        option1.setTitle(q.ans[0], for: .normal)
        option2.setTitle(q.ans[1], for: .normal)
        option3.setTitle(q.ans[2], for: .normal)
        option4.setTitle(q.ans[3], for: .normal)
    }
    
    @IBAction func ansPressed(_ sender: UIButton) {
        if sender.tag == game[id].correct {
            points += 1
        }
        
        if id == game.count-1 {
        let vc = storyboard?.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
            vc.gameDelegate = self
            vc.mainDelegate = delegate
            navigationController?.pushViewController(vc, animated: true)
            return
        }
        
        id += 1
        updateData()
    }
}

extension GameViewController: GameViewControllerDelegate {
    func getScore() -> Int {
        return points
    }
    
    func refreshData() {
        id = 0
        points = 0
    }
}
