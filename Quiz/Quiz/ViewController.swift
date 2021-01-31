import UIKit

protocol ViewControllerDelegate {
    func getGame()->[Quiz]
    func setAttempt(_ points: Int)
    func getHistory()->[Score]
 }

class ViewController: UIViewController {
    
    var game = [Quiz]()
    var history = [Score]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    func loadData(){
        game.append(Quiz(id: 1, question: "далеко", ans: ["grow up", "fall asleep", "far away", "strange"], correct: 2, choice: -1))
        game.append(Quiz(id: 2, question: "сражаться", ans: ["make a withdrawal", "tail feather", "bring over", "fight"], correct: 3, choice: -1))
        game.append(Quiz(id: 3, question: "спящий", ans: ["scares", "swear", "asleep", "clever"], correct: 2, choice: -1))
        game.append(Quiz(id: 4, question: "мудрый", ans: ["sold", "wise", "prune", "asleep"], correct: 1, choice: -1))
        game.append(Quiz(id: 5, question: "требовать", ans: ["demand", "get up", "reside", "explain"], correct: 0, choice: -1))
        game.append(Quiz(id: 6, question: "будить", ans: ["move", "wake", "tyke", "safe"], correct: 1, choice: -1))
        game.append(Quiz(id: 7, question: "пытаться", ans: ["get up", "key", "stay", "try"], correct: 3, choice: -1))
        game.append(Quiz(id: 8, question: "почта", ans: ["curse", "beasts", "wise", "post"], correct: 3, choice: -1))
        game.append(Quiz(id: 9, question: "разрешать", ans: ["since", "allow", "accept", "mention"], correct: 1, choice: -1))
        game.append(Quiz(id: 10, question: "звери", ans: ["trust", "beasts", "post", "through"], correct: 1, choice: -1))
    }
    @IBAction func playPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier:"GameViewController") as! GameViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func historyPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "HistoryViewController") as! HistoryViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: ViewControllerDelegate {
    func getHistory() -> [Score] {
        return history
    }
    
    func setAttempt(_ points: Int) {
        history.append(Score(title: "\(history.count+1) attempt", points: points))
    }
    
    func getGame() -> [Quiz] {
        return game
    }
}
