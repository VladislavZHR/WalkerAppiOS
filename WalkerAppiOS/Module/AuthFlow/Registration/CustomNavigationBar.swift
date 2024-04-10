import UIKit

class CustomNavigationBar: UINavigationBar {
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupNavigationBar()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setupNavigationBar()
       }
    
    private func setupNavigationBar() {
            self.barTintColor = .black
            self.tintColor = .white
            self.isTranslucent = false
            
            let titleAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white,
                .font: UIFont.boldSystemFont(ofSize: 20)
            ]
            self.titleTextAttributes = titleAttributes
            

            self.shadowImage = UIImage()
            self.setBackgroundImage(UIImage(), for: .default)
        }
    
}
