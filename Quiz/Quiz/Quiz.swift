import Foundation
public struct Quiz: Codable {
    let id: Int
    let question: String
    let ans: [String]
    let correct: Int
    var choice: Int
}
