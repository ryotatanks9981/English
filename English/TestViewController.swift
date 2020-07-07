import UIKit
import RealmSwift

class TestViewController: UIViewController {

    @IBOutlet weak var proLabel: UILabel!
    @IBOutlet weak var ansTextField: UITextField!
    
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        let words = realm.objects(Word.self)
        proLabel!.text = words[index].word
    }
    
    @IBAction func ansButton(_ sender: Any) {
        let realm = try! Realm()
        let words = realm.objects(Word.self)
        
        if ansTextField.text != "" {
            if words[index].mean == ansTextField.text {
                let alert: UIAlertController = UIAlertController(title: "正解！", message: nil, preferredStyle: .alert)
                let action: UIAlertAction = UIAlertAction(title: "次へ", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            } else {
                let alert: UIAlertController = UIAlertController(title: "残念！", message: nil, preferredStyle: .alert)
                let action: UIAlertAction = UIAlertAction(title: "次へ", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }
        } else {
            let alert: UIAlertController = UIAlertController(title: "解答を入力してください", message: nil, preferredStyle: .alert)
            let action: UIAlertAction = UIAlertAction(title: "了解", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
}
