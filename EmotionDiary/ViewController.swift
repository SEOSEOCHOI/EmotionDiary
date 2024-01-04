import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var emotions: [UILabel]!
    
    let buttonCount: [Int] = []

    let imageList: [String] = ["slime1", "slime2", "slime3", "slime4", "slime5", "slime6", "slime7", "slime8", "slime9"]
    
    let emotionList: [String] = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "행복해", "행복해"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()
        buttonDesign()
        emotionLabelDesign()
    }
    
    func didEmotionButtonClicked(button: UIButton) {
        for buttonItem in 0...buttons.count - 1 {
            if buttons[buttonItem] == button {
                
                emotions[buttonItem].text = ("\(emotionList[buttonItem]) \(button.tag)")
            }
        }
    }
    

    
    
    func emotionLabelDesign() {
        for count in 0...emotions.count - 1 {
            emotions[count].text = "\(emotionList[count]) \(buttons[count].tag)"
            
            emotions[count].textColor = .black
            emotions[count].font = .boldSystemFont(ofSize: 15)
            
            emotions[count].textAlignment = .center

        }
    }
    
    func buttonDesign() {
        for count in 0...buttons.count - 1 {
            buttons[count].setTitle("", for: .normal)
            buttons[count].setImage(UIImage(named: imageList[count]), for: .normal)
            buttons[count].imageView?.contentMode = .scaleAspectFit
        }
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
    
    @IBAction func emotionButtonClicked(_ sender: UIButton) {
            
        sender.tag += 1
        didEmotionButtonClicked(button: sender)
        /*
        // 랜덤 출력
        didEmotionButtonRandomClicked(button: sender)
         */
    }
}
/*
 func didEmotionButtonRandomClicked(button: UIButton) {
     for buttonItem in 0...buttons.count - 1 {
         if buttons[buttonItem] == button {
             
             emotions[buttonItem].text = ("\(emotionList[buttonItem]) \(Int.random(in: 0...100))")
         }
     }
 }
 */
