import UIKit
import SnapKit

enum buttonTitle: String{
    case AllClear = "AC"
    case EqualsSign = "="
    case PlusSign = "+"
    case MinusSign = "-"
    case MultipleSign = "*"
    case DivSign = "/"
}

protocol makeLineButtons{
    func makeButtonLine(buttonTitle: [String], target: Any?, action: Selector) -> [UIButton]
    
}


extension makeLineButtons{
    
    func makeButtonLine(buttonTitle: [String], target: Any?, action: Selector) -> [UIButton]{
        var buttons = [UIButton]()
        
        
        for title in 0..<buttonTitle.count{
            let button = UIButton()
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.setTitle(buttonTitle[title], for: .normal)
            button.addTarget(self, action: action, for: .touchUpInside)

            if Int(buttonTitle[title]) == nil {
                button.backgroundColor = .orange
            } else{
                button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            }
            
            button.layer.cornerRadius = 40
            
            button.snp.makeConstraints{
                make in
                make.height.equalTo(80)
                make.width.equalTo(80)
            }
            
            buttons.append(button)
        }
        return buttons
    }

}

