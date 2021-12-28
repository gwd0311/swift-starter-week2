//
//  main.swift
//  CodeStarterCamp_Week2
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var winningNumbers: Set<Int> = []
let myLottoNumbers: [Int] = [1, 2, 3, 4, 5, 6]
var randomNumber: Int = 0


func createRandomNumber() -> Int {
    randomNumber = Int.random(in: 1...45)
    return randomNumber
}

func createWinningNumbers() -> Set<Int> {
    
    while winningNumbers.count < 6 {
        randomNumber = createRandomNumber()
        winningNumbers.insert(randomNumber)
    }
    print("당첨 번호: \(winningNumbers)")
    return winningNumbers
}

func compareLottoNumbers(_ winningNumbers: Set<Int>, _ myNumbers: [Int]) -> String {
    var matchedNumbers: String = ""
    var resultMessage: String = ""
    
    if myNumbers.count < 1 || myNumbers.count > 7 {
        resultMessage = "로또 번호를 입력하지 않았거나, 너무 많은 번호가 있습니다."
        return resultMessage
    } else {
        for myNumber in myNumbers {
            if winningNumbers.contains(myNumber) {
                matchedNumbers += "\(myNumber), "
            } else {
                continue
            }
        }
        let indexOfLastComma = matchedNumbers.lastIndex(of: ",") ?? matchedNumbers.endIndex
        let matchedNumbersUntilLastComma = matchedNumbers[..<indexOfLastComma]
        if matchedNumbers.count > 0 {
            resultMessage = "축하합니다! 겹치는 번호는 \(matchedNumbersUntilLastComma) 입니다!"
            return resultMessage
        } else {
            resultMessage = "아쉽지만 겹치는 번호가 없습니다."
            return resultMessage
        }
    }
}

func checkLotto(myNumbers: [Int]) {
    let winningNumbers = createWinningNumbers()
    print(compareLottoNumbers(winningNumbers, myNumbers))
}

checkLotto(myNumbers: myLottoNumbers)








