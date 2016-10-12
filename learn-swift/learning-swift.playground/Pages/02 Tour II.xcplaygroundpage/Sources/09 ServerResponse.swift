import Foundation

public enum ServerResponse {
    case result(String, String)
    case failure(String)
    case third(String)
}
