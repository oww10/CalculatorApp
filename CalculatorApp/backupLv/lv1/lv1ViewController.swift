//import UIKit
//import SnapKit
//
//class lv1ViewController: UIViewController {
//    
//    let resultText = UILabel()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUpUI()
//    }
//    
//    private func setUpUI(){
//        
//        resultText.backgroundColor = .black
//        resultText.font = .boldSystemFont(ofSize: 60)
//        resultText.textAlignment = .right
//        resultText.text = "12345"
//        resultText.textColor = .white
//        
//        view.addSubview(resultText)
//        
//        resultText.snp.makeConstraints{
//            make in
//            make.top.equalToSuperview().offset(200)
//            make.leading.equalToSuperview().offset(30)
//            make.trailing.equalToSuperview().offset(-30)
//            make.height.equalTo(100)
//        }
//    }
//    
//}
//
//#Preview{
//    lv1ViewController()
//}
