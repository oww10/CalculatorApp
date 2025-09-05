import UIKit
import SnapKit

class Calculator: UIViewController, makeLineButtons{
    
    let operators = ["+", "-", "*", "/"]
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
        setUpLayer()
    }
    
    @objc func buttonTapped(_ sender: UIButton){
        // resultText.Text 에 표시된 텍스트
        let defaltTextNum = resultText.text ?? "0"
        // 현재 resultText.Text의 마지막 문자를 가져옴
        let lastChar = defaltTextNum.last ?? "1"
        
        //문자열의 수식을 계산하여 Int로 반환하는 함수
        func calculate(expression: String) throws -> Int? {
            let expression = NSExpression(format: expression)
            if let result = expression.expressionValue(with: nil, context: nil) as? Int {
                return result
            } else {
                //계산에 실패하면 에러를 발생
                throw ValidateError.invalidExpression
            }
        }
        
        //클릭한 버튼의 title을 안전하게 가져오기
        guard let buttonNum: String = sender.title(for: .normal) else{ return }
        
        
        
        //내가 누른 버튼의 title이 "AC"이면 0으로 초기화.
        if buttonNum == "AC"{
            print(defaltTextNum)
            resultText.text = "0"
        }
        //내가 누른 버튼의 title이 "=" 이면 실행
        else if buttonNum == "="{
            
            //예외 처리: 수식이 연산자로 끝나는 경우 0으로 초기화
            if operators.contains(String(lastChar)) {
                resultText.text = "0"
                print("연산자로 끝이나서 초기화합니다.")
                return
            }
            
            // do - try - catch문 사용하여 calculate에서 발생하는 오류 처리
            do {
                let result = try calculate(expression: defaltTextNum)
                //계산 결과 resultText.text 넣고 결과값이 nil이면 "0"
                resultText.text = result?.description ?? "0"
            } catch {
                //에러가 발생하면 자동으로 앱 크러쉬 나지 않게 resultText.text를 "0"으로 초기화
                resultText.text = "0"
            }
        }
        
        //올바른 버튼을 눌렀을 경우
        else {
            //현재 결과창이 0이면 누른 버튼의 값으로 덮어쓰기
            if defaltTextNum == "0"{
                resultText.text = buttonNum
            }
            
            //결과창이 "0"이 아닐때 기존 텍스트에 새로 누른 버튼의 값을 붙이기
            else {
                
                //예외 처리 : 연속으로 연산자가 입력되는 것을 방지
                if operators.contains(String(lastChar)){
                    //마지막 문자열이 연산자이고 누른 버튼이 연산자 일때 기존 텍스트 유지
                    if operators.contains(buttonNum){
                        print("연산자 입니다.")
                        resultText.text = defaltTextNum
                    }
                    //마지막 문자가 연산자가 아닌 경우 정상적으로 작동
                    else{
                        print("정수형입니다.")
                        resultText.text = defaltTextNum + buttonNum
                    }
                }
                //마지막 문자 연산자가 아닌 경우 정상적으로 작동
                else{
                    resultText.text = defaltTextNum + buttonNum
                }
            }
            
        }
    }
    
    
    
    
    private func configureUI(){
        view.backgroundColor = .black
        view.addSubview(resultText)
        view.addSubview(VerticalStackView)
        
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
        
        
        [firstVerticalView,secondVerticalView,thirdVerticalView,fourthVerticalView].forEach{
            VerticalStackView.addArrangedSubview($0)
        }
        
    }
    
    private func setUpLayer(){
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
