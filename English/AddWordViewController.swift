import UIKit
import RealmSwift

class AddWordViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var meanTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordTextField.delegate = self
        meanTextField.delegate = self
    }
    
    @IBAction func tex(_ sender: Any) {
    }
    
    @IBAction func sectex(_ sender: Any) {
    }
    
    @IBAction func setButton(_ sender: UIButton) {
        let engWord = Word()
        let realm = try! Realm()
        
        if self.wordTextField.text != "", self.meanTextField.text != "" {
            engWord.word = wordTextField.text!
            engWord.mean = meanTextField.text!
            try! realm.write {
                realm.add(engWord)
            }
            self.navigationController?.popViewController(animated: true)
        }
        
        if wordTextField.text!.isEmpty || meanTextField.text!.isEmpty {
            let alert: UIAlertController = UIAlertController(title: "必要な項目が入力されていません", message: "", preferredStyle: .alert)
            let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
    }    
}
