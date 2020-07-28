
import Foundation
import FirebaseAuth

protocol ResponseDelegate {
    func onApiResponse(user : AuthDataResult)
    func onErrorResponse(error : Error?)
}
