//
//  ResultViewController.swift
//  NamesCompApp
//
//  Created by Глеб on 20.07.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var namesLabal: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var firstName: String!
    var secondName: String!
    
    private var resultValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultValue = findResult()
        
        namesLabal.text = "\(firstName ?? "") and \(secondName ?? "")"
        resultLabel.text = resultValue.formatted(.percent)
        
        progressView.progress = Float(resultValue) / 100
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 4)
    }
    
    private func findValue(for name: String) -> Int {
        var count = 0
        
        for character in name.lowercased(){
            switch character {
            case "a", "i", "j", "q", "y":
                count += 1
            case "b", "k", "r":
                count += 2
            case "c", "g", "l", "s":
                count += 3
            case "d", "m", "t":
                count += 4
            case "e", "h", "n", "x":
                count += 5
            case "u", "v", "w":
                count += 6
            case "o", "z":
                count += 7
            case "f", "p":
                count += 8
            default :
                count += 0
            }
        }
        return count
    }
    
    private func findResult() -> Int {
        var result = 0
        
        let firstValue = findValue(for: firstName)
        let secondValue = findValue(for: secondName)
        let absDifference = abs(firstValue - secondValue)
        
        switch absDifference {
        case 0, 1, 2:
            result = Int.random(in: 70..<101)
        case 3:
            result = 69
        case 4:
            result = Int.random(in: 50..<69)
        case 5:
            result = Int.random(in: 35..<50)
        case 6:
            result = Int.random(in: 20..<35)
        default:
            result = Int.random(in: 0..<20)
        }
        return result
        
    }
    
}
