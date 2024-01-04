// UserDeafults 를 활용하여 감정 횟수가 영구적으로 유지되도록 설정하세요

import UIKit

class SaveCountViewController: UIViewController {
    
    // @IBOutlet var buttons: [UIButton]!
    @IBOutlet var emotions: [UILabel]!
    
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    
    
    let imageList: [String] = ["slime1", "slime2", "slime3", "slime4", "slime5", "slime6", "slime7", "slime8", "slime9"]
    
    let emotionList: [String] = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "행복해", "행복해"]
    
    let oneButtonTag = UserDefaults.standard.integer(forKey: "one")
    
    let twoButtonCount = UserDefaults.standard.integer(forKey: "two")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()
        buttonDesign()
        emotionLabelDesign()
        
        
    }
    
    //`        // 1. UD의 저장된 값을 가지고 오기
    //        let number = UserDefaults.standard.integer(forKey: "Number")
    //        // 2. 가지고 온 값을 + 1 하기
    //        let newNumber = number + 1
    //        // 3. 변경된 값을 UD 업데이트!
    //        UserDefaults.standard.set(newNumber, forKey: "Number")
    //        // 4. UD에 저장된 값 가지고 오기
    //        emotionOneLabel.text = "좋아해 \(UserDefaults.standard.integer(forKey: "Number"))"
    
    func didEmotionButtonClicked(button: UIButton) {
        
        if button == oneButton {
            
            let buttonOneClicked = UserDefaults.standard.integer(forKey: "one")
            print(buttonOneClicked)
            
            let buttonOneCount = buttonOneClicked + 1
            //oneButtonTag = buttonOneCount
            
            UserDefaults.standard.set(buttonOneCount, forKey: "one")
            print(buttonOneCount)
            
            emotions[0].text = ("\(emotionList[0]) \(UserDefaults.standard.integer(forKey: "one"))")
        }
        
        if button == twoButton {
            let buttonTwoClicked = UserDefaults.standard.integer(forKey: "two")
            
            let buttonTwoCount = buttonTwoClicked + 1
            //oneButtonTag = buttonOneCount
            
            UserDefaults.standard.set(buttonTwoCount, forKey: "one")
            
            emotions[1].text = ("\(emotionList[1]) \(UserDefaults.standard.integer(forKey: "two"))")
        }
    }
        
        @IBAction func OneButtonClicked(_ sender: UIButton) {
            
            print(UserDefaults.standard.integer(forKey: "one"))
            didEmotionButtonClicked(button: oneButton)
        }
        
        @IBAction func twoButtonClicked(_ sender: UIButton) {
            UserDefaults.standard.set(twoButton.tag, forKey: "two")
            didEmotionButtonClicked(button: twoButton)
            
        }
        
        func emotionLabelDesign() {
            emotions[0].text = ("\(emotionList[0]) \(UserDefaults.standard.integer(forKey: "one"))") //
            
            emotions[0].textColor = .black
            emotions[0].font = .boldSystemFont(ofSize: 15)
            
            emotions[0].textAlignment = .center
            
            emotions[1].text = "\(emotionList[1]) \(twoButton.tag)"
            
            emotions[1].textColor = .black
            emotions[1].font = .boldSystemFont(ofSize: 15)
            
            emotions[1].textAlignment = .center
        }
        
        func buttonDesign() {
            oneButton.tag = 0
            oneButton.setTitle("", for: .normal)
            oneButton.setImage(UIImage(named: imageList[0]), for: .normal)
            oneButton.imageView?.contentMode = .scaleAspectFit
            
            twoButton.setTitle("", for: .normal)
            twoButton.setImage(UIImage(named: imageList[0]), for: .normal)
            twoButton.imageView?.contentMode = .scaleAspectFit
        }
        
        func setNavigationItem() {
            navigationItem.title = "감정다이어리"
            
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.triangle"), style: .plain, target: self, action: #selector(rightbarButtonClikced))
            navigationItem.leftBarButtonItem?.tintColor = .black
        }
        
        @objc func rightbarButtonClikced() {
            print("bar button item clicked!")
            // 1. 컨텐츠
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            // 2. 버튼
            let oneButton = UIAlertAction(title: "버튼 1", style: .cancel)
            let twoButton = UIAlertAction(title: "버튼 2", style: .destructive)
            // 3. 컨텐츠 + 버튼
            
            alert.addAction(twoButton)
            alert.addAction(oneButton)
            // 4. 띄우기
            present(alert, animated: true)
        }
    }
    
