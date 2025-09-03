//import UIKit
//import SnapKit
//
//
//class lv3ViewController: UIViewController, makeLineButtons{
//    let resultText: UILabel = {
//        let text = UILabel()
//        let but = UIButton()
//        
//        text.text = "12345"
//        text.textColor = .white
//        text.backgroundColor = .black
//        text.font = .boldSystemFont(ofSize: 60)
//        text.textAlignment = .right
//        
//        
//        return text
//    }()
//    
//    func makeHorizontalStackView(_ views: [UIView]) -> UIStackView{
//        let stackView = UIStackView()
//        
//        stackView.axis = .horizontal
//        stackView.backgroundColor = .black
//        stackView.spacing = 10
//        stackView.distribution = .fillEqually
//        
//        
//        for view in views {
//            stackView.addArrangedSubview(view)
//        }
//        
//        return stackView
//    }
//    
//    func makeVerticalStackView(_ views: [UIView]) -> UIStackView{
//        let stackView = UIStackView()
//        
//        stackView.axis = .vertical
//        stackView.backgroundColor = .black
//        stackView.spacing = 10
//        stackView.distribution = .fillEqually
//        
//        
//        for view in views {
//            stackView.addArrangedSubview(view)
//        }
//        
//        return stackView
//    }
//    
//    let buttonsStackView: UIStackView = {
//        let stackView = UIStackView()
//        
//        stackView.spacing = 10
//        
//        return stackView
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        configureUI()
//    }
//    
//    
//    private func configureUI(){
//        view.backgroundColor = .black
//        view.addSubview(resultText)
//        
//        //Utils의 ButtonMakeProtocol의 변화로 인해 오류 발생. 다시 실행시키기 위해서는 target과, action을 추가시켜야함.
////        let firstButtonsLine = makeButtonLine(buttonTitle: ["7","4","1","AC"])
////        let secondButtonsLine = makeButtonLine(buttonTitle: ["8","5","2","0"])
////        let thirdButtonsLine = makeButtonLine(buttonTitle: ["9","6","3","="])
////        let fourthButtonsLine = makeButtonLine(buttonTitle: ["+","-","*","/"])
////        
////        let firstVerticalView = makeVerticalStackView(firstButtonsLine)
////        let secondVerticalView = makeVerticalStackView(secondButtonsLine)
////        let thirdVerticalView = makeVerticalStackView(thirdButtonsLine)
////        let fourthVerticalView = makeVerticalStackView(fourthButtonsLine)
//        
//        
////        [firstVerticalView,secondVerticalView,thirdVerticalView,fourthVerticalView].forEach{
////            view.addSubview($0)
////        }
////        
////        view.addSubview(buttonsStackView)
////        [firstVerticalView,secondVerticalView,thirdVerticalView,fourthVerticalView].forEach{
////            buttonsStackView.addArrangedSubview($0)
////        }
//        
//         
//        resultText.snp.makeConstraints{
//            make in
//            make.leading.equalToSuperview().offset(30)
//            make.trailing.equalToSuperview().offset(-30)
//            make.top.equalToSuperview().offset(200)
//            make.height.equalTo(100)
//        }
//
////        buttonsStackView.snp.makeConstraints{
////            make in
////            make.width.equalTo(350)
////            make.top.equalTo(resultText.snp.bottom).offset(60)
////            make.centerX.equalToSuperview()
////        }
//        
//    }
//    
//}
//#Preview{
//    lv3ViewController()
//}
