//import UIKit
//import SnapKit
//
//class lv2ViewController: UIViewController{
//    
//    
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
//    func makeFirstLineButtons() -> [UIButton]{
//        let firstButton = ["7","8","9","+"]
//        var buttons = [UIButton]()
//        
//        for title in 0..<firstButton.count{
//            let button = UIButton()
//            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
//            button.setTitle(firstButton[title], for: .normal)
//            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
//            button.layer.cornerRadius = 40
//            button.snp.makeConstraints{
//                make in
//                make.height.equalTo(80)
//                make.width.equalTo(80)
//            }
//            
//            buttons.append(button)
//        }
//
//        
//        return buttons
//        
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        configureUI()
//    }
//    
//    private func configureUI(){
//        view.backgroundColor = .black
//        view.addSubview(resultText)
//        let firstButtons = makeFirstLineButtons()
//        
//        let makeViews =
//        makeHorizontalStackView(firstButtons)
//        
//        view.addSubview(makeViews)
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
//
//        
//        makeViews.snp.makeConstraints{
//            make in
//            make.top.equalTo(resultText.snp.bottom)
//            make.height.equalTo(80)
//            make.leading.equalToSuperview().offset(30)
//            make.trailing.equalToSuperview().offset(-30)
//        }
//
//        
//    }
//    
//}
//#Preview{
//    lv2ViewController()
//}
