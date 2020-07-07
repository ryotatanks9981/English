import UIKit
import RealmSwift

class Word: Object, Identifiable {
    @objc dynamic var word = ""
    @objc dynamic var mean = ""
}
