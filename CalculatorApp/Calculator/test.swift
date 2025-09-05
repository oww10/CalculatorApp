//
//  test.swift
//  CalculatorApp
//
//  Created by s s on 9/5/25.
//

import Foundation

/*
 @objc func buttonTapped(_ sender: UIButton){
     
     func calculate(expression: String) throws -> Int? {
         let expression = NSExpression(format: expression)
         if let result = expression.expressionValue(with: nil, context: nil) as? Int {
             return result
         } else {
             
             throw ValidateError.invalidExpression
         }
     }
     
     guard let buttonNum: String = sender.title(for: .normal) else{
         
         return
     }
     
     let defaltTextNum = resultText.text ?? "0"
     
     if buttonNum == "AC"{
         print(defaltTextNum)
         resultText.text = "0"
     } else if buttonNum == "="{
         
         //마지막 Text가 연산자면 초기화
         let operators = ["+", "-", "*", "/"]
         if let lastChar = defaltTextNum.last, operators.contains(String(lastChar)) {
             resultText.text = "0"
             print("연산자로 끝이나서 초기화합니다.")
             return
         }
         do {
             let result = try calculate(expression: defaltTextNum)
             
             resultText.text = result?.description ?? "0"
             
         } catch {
             resultText.text = "0"
         }
     } else {
         if defaltTextNum == "0"{
             resultText.text = buttonNum
         } else {
             resultText.text = defaltTextNum + buttonNum
             
             let operators = ["+", "-", "*", "/"]
             if let lastChar = defaltTextNum.last, operators.contains(String(lastChar)){
                 if operators.contains(buttonNum){
                     
                     print("연산자 입니다.")
                     resultText.text = defaltTextNum
                 } else{
                     print("정수형입니다.")
                     resultText.text = defaltTextNum + buttonNum
                 }
                                     
             }
             
         }
     }
 }
 */
