let seoul : [String:Int] = ["중구":11140,"영등포구":11560,"중랑구":11260,"은평구":11380,"금천구":11545,"동작구":11590,"강남구":11680,"종로구":11110,"용산구":11170,"광진구":11215,"양천구":11470,"관악구":11620,"서대문구":11410,"마포구":11440,"성동구":11200,"강북구":11305,"서초구":11650,"송파구":11710,"강동구":11740,"성북구":11290,"도봉구":11320,"노원구":11350,"강서구":11500,"구로구":11530,"동대문구":11230]
let busan : [String:Int] = ["부산진구":26230,"사상구":26530,"서구":26140,"연제구":26470,"사하구":26380,"강서구":26440,"중구":26110,"동래구":26260,"수영구":26500,"동구":26170,"금정구":26410,"남구":26290,"영도구":26200,"해운대구":26350,"기장군":26710,"북구":26320]
let daegu : [String:Int] = ["달성군": 27710,"남구": 27200,"서구": 27170,"달서구": 27290,"수성구": 27260,"중구": 27110,"북구": 27230,"동구": 27140]
let incheon : [String:Int] = ["미추홀구":28177,"강화군":28710,"동구":28140,"옹진군":28720,"부평구":28237,"남동구":28200,"계양구":28245,"서구":28260,"연수구":28185,"중구":28110]
let API_KEY = "1081efe144f64d80af0e327f0f74056c"
let AD_KEY = "ca-app-pub-8165861186284559/9874042557"
let TEST_AD_KEY = "ca-app-pub-3940256099942544/2934735716"
let gwangju : [String:Int] = ["북구":29170,"서구":29140,"남구":29155,"광산구":29200,"동구":29110]
let daejeon = ["대덕구":30230,"동구":30110,"서구":30170,"중구":30140,"유성구":30200]
let ulsan = ["중구":31110,"동구":31170,"남구":31140,"울주군":31710,"북구":31200]
let sejong = ["세종특별자치시":36110]
let gyeongi = ["수원시 장안구":41111,"파주시":41480,"의정부시":41150,"남양주시":41360,"오산시":41370,"시흥시":41390,"용인시 처인구":41461,"부천시":41190,"부천시 소사구":41197,"안성시":41550,"화성시":41590,"김포시":41570,"여주시":41670,"수원시 팔달구":41115,"수원시 영통구":41117,"안양시 동안구":41173,"광명시":41210,"평택시":41220,"안산시 상록구":41271,"안산시 단원구":41273,"양주시":41630,"연천군":41800,"수원시":41110,"동두천시":41250,"용인시 기흥구":41463,"포천시":41650,"양평군":41830,"안양시":41170,"의왕시":41430,"성남시":41130,"성남시 수정구":41131,"하남시":41450,"광주시":41610,"가평군":41820,"수원시 권선구":41113,"성남시 분당구":41135,"고양시 일산서구":41287,"과천시":41290,"구리시":41310,"군포시":41410,"용인시 수지구":41465,"이천시":41500,"안양시 만안구":41171,"고양시 덕양구":41281,"고양시 일산동구":41285,"성남시 중원구":41133]
let gangwon = ["삼척시":42230,"영월군":42750,"고성군":42820,"춘천시":42110,"태백시":42190,"양구군":42800,"인제군":42810,"양양군":42830,"홍천군":42720,"정선군":42770,"강릉시":42150,"동해시":42170,"속초시":42210,"횡성군":42730,"평창군":42760,"화천군":42790,"원주시":42130,"철원군":42780]
let chungbuk = ["제천시":43150,"괴산군":43760,"보은군":43720,"청주시 상당구":43111,"청주시 청원구":43114,"영동군":43740,"청주시 흥덕구":43113,"증평군":43745,"음성군":43770,"단양군":43800,"충주시":43130,"옥천군":43730,"청주시 서원구":43112,"진천군":43750]
let chungnam = ["보령시":44180,"홍성군":44800,"천안시 동남구":44131,"서산시":44210,"논산시":44230,"청양군":44790,"아산시":44200,"부여군":44760,"천안시 서북구":44133,"태안군":44825,"계룡시":44250,"당진시":44270,"예산군":44810,"공주시":44150,"금산군":44710,"서천군":44770]
let jeonbuk = ["정읍시":45180,"고창군":45790,"임실군":45750,"전주시 완산구":45111,"군산시":45130,"순창군":45770,"부안군":45800,"전주시 덕진구":45113,"익산시":45140,"완주군":45710,"장수군":45740,"진안군":45720,"김제시":45210,"남원시":45190,"무주군":45730]
let jeonnam = ["목포시":46110,"장성군":46880,"완도군":46890,"구례군":46730,"여수시":46130,"나주시":46170,"화순군":46790,"영광군":46870,"담양군":46710,"곡성군":46720,"고흥군":46770,"장흥군":46800,"무안군":46840,"보성군":46780,"해남군":46820,"광양시":46230,"영암군":46830,"신안군":46910,"강진군":46810,"진도군":46900,"함평군":46860,"순천시":46150]
let gyungbuk = ["구미시":47190,"성주군":47840,"영덕군":47770,"고령군":47830,"칠곡군":47850,"예천군":47900,"울진군":47930,"봉화군":47920,"포항시 남구":47111,"영주시":47210,"경산시":47290,"군위군":47720,"청송군":47750,"청도군":47820,"울릉군":47940,"경주시":47130,"김천시":47150,"안동시":47170,"상주시":47250,"문경시":47280,"의성군":47730,"영양군":47760,"포항시":47110,"영천시":47230,"포항시 북구":47113]
let gyungnam = ["거제시":48310,"양산시":48330,"창녕군":48740,"고성군":48820,"함양군":48870,"사천시":48240,"의령군":48720,"산청군":48860,"합천군":48890,"창원시 의창구":48121,"통영시":48220,"밀양시":48270,"하동군":48850,"거창군":48880,"창원시":48120,"창원시 마산회원구":48127,"진주시":48170,"함안군":48730,"남해군":48840,"창원시 성산구":48123,"창원시 마산합포구":48125,"창원시 진해구":48129,"김해시":48250]
let jeju = ["서귀포시":50130,"제주시":50110]


let data: [String:[String:Int]] = ["서울특별시": seoul,"부산광역시":busan,"대구광역시":daegu,"인천광역시":incheon,"광주광역시":gwangju,"대전광역시":daejeon, "울산광역시":ulsan, "세종특별자치시":sejong,"경기도":gyeongi,"강원도":gangwon,"충청북도":chungbuk,"충청남도":chungnam,"전라북도":jeonbuk,"전라남도":jeonnam,"경상북도":gyungbuk,"경상남도":gyungnam,"제주특별자치도":jeju]
