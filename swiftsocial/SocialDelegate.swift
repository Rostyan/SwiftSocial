
import Foundation

protocol SocialDelegate {
    func onFBSuccessResponse(user : Any)
    func onFBErrorResponse(error : Error?)
    
    func onGoogleSuccessResponse(user : Any)
    func onGoogleErrorResponse(error : Error?)
}
