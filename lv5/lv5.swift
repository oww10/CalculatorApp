import UIKit
import SnapKit

class lv5ViewController: UIViewController, makeLineButtons{
    let resultText: UILabel = {
        let text = UILabel()
        let but = UIButton()
        
        text.text = "12345"
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
    
    @objc func buttonTapped(){
        print("buttonTap")
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
    lv5ViewController()
}
