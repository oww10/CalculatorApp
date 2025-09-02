import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let lv1ViewMain = lv1View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(lv1ViewMain)
        
        lv1ViewMain.snp.makeConstraints(){
            make in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        }
    }


}

#Preview{
    ViewController()
}
