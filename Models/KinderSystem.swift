import Foundation

struct KinderSystemArr: Codable{
    var status: String
    var kinderInfo: [KinderSystem]
    
    enum CodingKeys: String, CodingKey{
        case status
        case kinderInfo = "kinderInfo"
    }
}
struct KinderSystem: Codable{
    let code: String
    let name: String
    let kind: String
    let year: String
    let floor: String
    let area: String
    let total_area: String
    
    enum CodingKeys: String,CodingKey {
        case code = "kindercode"
        case name = "kindername"
        case kind = "establish"
        case year = "archyy"
        case floor = "floorcnt"
        case area = "bldgprusarea"
        case total_area = "grottar"

    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? "-"
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? "-"
        kind = try values.decodeIfPresent(String.self, forKey: .kind) ?? "-"
        year = try values.decodeIfPresent(String.self, forKey: .year) ?? "-"
        floor = try values.decodeIfPresent(String.self, forKey: .floor) ?? "-"
        area = try values.decodeIfPresent(String.self, forKey: .area) ?? "-"
        total_area = try values.decodeIfPresent(String.self, forKey: .total_area) ?? "-"

    }
}
