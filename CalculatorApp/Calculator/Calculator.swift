import UIKit
import SnapKit

class Calculator: UIViewController, makeLineButtons{
    let resultText: UILabel = {
        var text = UILabel()
        
        text.text = "0"
        text.textColor = .white
        text.backgroundColor = .black
        text.font = .boldSystemFont(ofSize: 60)
        text.textAlignment = .right
        
        
        return text
    }()
    
    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView{
        let stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        
        for view in views {
            stackView.addArrangedSubview(view)
        }
        
        return stackView
    }
    
    let VerticalStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
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
    
    
    
    private func configureUI(){
        view.backgroundColor = .black
        view.addSubview(resultText)
        
        let firstButtonsLine = makeButtonLine(buttonTitle: ["7","8","9","+"]
                                              ,target: self, action: #selector(buttonTapped))
        let secondButtonsLine = makeButtonLine(buttonTitle: ["4","5","6","-"]
                                               ,target: self, action: #selector(buttonTapped))
        let thirdButtonsLine = makeButtonLine(buttonTitle: ["1","2","3","*"]
                                              ,target: self, action: #selector(buttonTapped))
        let fourthButtonsLine = makeButtonLine(buttonTitle: ["AC","0","=","/"]
                                               ,target: self, action: #selector(buttonTapped))
        
        let firstVerticalView = makeHorizontalStackView(firstButtonsLine)
        let secondVerticalView = makeHorizontalStackView(secondButtonsLine)
        let thirdVerticalView = makeHorizontalStackView(thirdButtonsLine)
        let fourthVerticalView = makeHorizontalStackView(fourthButtonsLine)
        
        
        [firstVerticalView,secondVerticalView,thirdVerticalView,fourthVerticalView].forEach{
            view.addSubview($0)
        }
        
        view.addSubview(VerticalStackView)
        [firstVerticalView,secondVerticalView,thirdVerticalView,fourthVerticalView].forEach{
            VerticalStackView.addArrangedSubview($0)
        }
        
        
        resultText.snp.makeConstraints{
            make in
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.top.equalToSuperview().offset(200)
            make.height.equalTo(100)
        }
        
        
        
        VerticalStackView.snp.makeConstraints{
            make in
            make.width.equalTo(350)
            make.top.equalTo(resultText.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
        
    }
    
}
#Preview{
    Calculator()
}
