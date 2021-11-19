import Foundation

struct KinderArr: Codable{
    var status: String
    var kinderInfo: [Kinder]
    
    enum CodingKeys: String, CodingKey{
        case status
        case kinderInfo = "kinderInfo"
    }
}
struct Kinder: Codable{
    let office: String
    let sub_office: String
    let code: String
    let name: String
    let kind: String
    let owner: String
    let headTeacher: String
    let edate: String
    let odate: String
    let addr: String
    let tel: String
    let url: String
    let opertime: String
    
    enum CodingKeys: String,CodingKey {
        case office = "officeedu"
        case sub_office = "subofficeedu"
        case code = "kindercode"
        case name = "kindername"
        case kind = "establish"
        case owner = "rppnname"
        case headTeacher = "ldgrname"
        case edate = "edate"
        case odate = "odate"
        case addr = "addr"
        case tel = "telno"
        case url = "hpaddr"
        case opertime = "opertime"

    }
    init(){
            self.office = "Ex_서울교육지원청"
            self.sub_office = "Ex_강남서초교육지원청"
            self.code = "1ecec08c-f023-b044-e053-0a32095ab044"
            self.name = "Ex_Name"
            self.kind = "Ex_공립(단설)"
            self.owner = "Ex_창립자"
            self.headTeacher = "Ex_원장님"
            self.edate = "Ex_설립일자"
            self.odate = "Ex_개원일자"
            self.addr = "Ex_서울특별시 강남구 논현로 111 2층"
            self.tel = "Ex_02-333-4444"
            self.url = "https://petalite-sycamore-04f.notion.site/To-Do-List-6aa252498f5848c2a2fc646520303868"
            self.opertime = "Ex_07시00분~19시30분    "
            
            
        }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        office = try values.decodeIfPresent(String.self, forKey: .office) ?? "-"
        sub_office = try values.decodeIfPresent(String.self, forKey: .sub_office) ?? "-"
        code = try values.decodeIfPresent(String.self, forKey: .code) ?? "-"
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? "-"
        kind = try values.decodeIfPresent(String.self, forKey: .kind) ?? "-"
        owner = try values.decodeIfPresent(String.self, forKey: .owner) ?? "-"
        headTeacher = try values.decodeIfPresent(String.self, forKey: .headTeacher) ?? "-"
        edate = ParseManager.shared.formatDate(try values.decodeIfPresent(String.self, forKey: .edate) ?? "-")
        odate = ParseManager.shared.formatDate(try values.decodeIfPresent(String.self, forKey: .odate) ?? "-")
        addr = try values.decodeIfPresent(String.self, forKey: .addr) ?? "-"
        tel = try values.decodeIfPresent(String.self, forKey: .tel) ?? "-"
        url = try values.decodeIfPresent(String.self, forKey: .url) ?? "-"
        opertime = try values.decodeIfPresent(String.self, forKey: .opertime) ?? "-"
    }
}
