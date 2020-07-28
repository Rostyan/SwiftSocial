
import UIKit
import Firebase 

class FirebaseViewController: BaseViewController, ResponseDelegate, UITextFieldDelegate {
    
    @IBOutlet var textFieldUserName: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    @IBOutlet var imagePlatform: UIImageView!
    @IBOutlet var labelUserName: UILabel!
    @IBOutlet var labelUserDetails: UILabel!
    @IBOutlet var labelError: UILabel! 
    
    var credential : AuthCredential?
    var platform : Platform?
    let fireAuth = FirebaseAuthenticator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showPlatformSpecificImage()
        labelError.isHidden = true
        
        textFieldUserName.delegate = self
        textFieldPassword.delegate = self
        fireAuth.delegate = self
        
    }
    
    func showPlatformSpecificImage(){
        imagePlatform.image = UIImage(named: (platform?.platformImage)!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textFieldUserName:
            textFieldPassword.becomeFirstResponder()
        case textFieldPassword:
            textFieldPassword.resignFirstResponder()
        default:
            textFieldPassword.resignFirstResponder()
        }
        labelError.isHidden = true
        return true
    }
        
    func onApiResponse(user: AuthDataResult) {
        hideProgressIndicator()
        print(user)
        
        labelUserName.text = user.user.displayName
        labelUserDetails.text = user.user.email
    }
    
    func onErrorResponse(error: Error?) {
        hideProgressIndicator()
        print(error.debugDescription)
        labelUserName.text = error?.localizedDescription
        labelUserDetails.text = error.debugDescription
    }
    
    func performPlatformSpecificLogin(){
               switch(platform?.platformName){
               case "Google":
        
                   break;
        
               case "Facebook":
        
                   break;
                   
               default:
                   print("text")
               }
    }
}
