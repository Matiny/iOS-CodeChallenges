import UIKit

/* Transportation on vacation */

func RentalCarCost(_ days: Int) -> Int {
    if days >= 7 {
        return days * 40 - 50
    }else if days >= 3 {
        return days * 40 - 20
    }else {
        return days * 40
    }
}

/* Testing firstIndex */

//let sample: [String] = ["Audi", "Acura", "BMW"]
//
//if let index = sample.firstIndex(of: "Acura") {
//    print(index)
//}

/* Convert a Boolean to a String */

//🥉This solution was #3 on Codewars' best solutions

func booleanToString(_ b: Bool) -> String {
  return "\(b)"
}

let fighters = [
    ["Ryu", "E.Honda", "Blanka", "Guile", "Balrog", "Vega"],
    ["Ken", "Chun Li", "Zangief", "Dhalsim", "Sagat", "M.Bison"]
]

enum Direction {
    case up
    case down
    case left
    case right
}

func streetFighterSelection(fighters: [[String]], position: (row: Int, column: Int), moves: [Direction]) -> [String] {
    
    var fightersArray: [String] = []
    
    var currentPosition = position
    moves.map {
        switch $0 {
        case .up:
            // Only allow user to go up if on bottom row
            if currentPosition.row == 1 {
                currentPosition.row = 0
            }
            fightersArray.append(fighters[currentPosition.row][currentPosition.column])
            
        case .down:
            // Only allow user to go down if on top row
            if currentPosition.row == 0 {
                currentPosition.row = 1
            }
            fightersArray.append(fighters[currentPosition.row][currentPosition.column])
            
        case .left:
            // Loop to other side if on far left
            if currentPosition.column == 0 {
                currentPosition.column = 5
            } else {
                currentPosition.column -= 1
            }
            fightersArray.append(fighters[currentPosition.row][currentPosition.column])
            
        case .right:
            // Loop to other side if on far right
            if currentPosition.column == 5 {
                currentPosition.column = 0
            } else {
                currentPosition.column += 1
            }
            fightersArray.append(fighters[currentPosition.row][currentPosition.column])
            
        default:
            break
        }
    }
    
  return fightersArray
}


func wave(_ y: String) -> [String] {
    let wordArray = y.map { String($0) }
    var waveArray: [String] = []
    for (index, element) in wordArray.enumerated() where element != " "{
        var dummyArray = wordArray
        dummyArray[index] = element.uppercased()
        waveArray.append(dummyArray.joined())
    }
  return waveArray
}

print(wave("One Two"))
