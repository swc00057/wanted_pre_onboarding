# 원티드 프리온보딩 코스 사전과제

### 제약사항 및 해결

- 과제 수행과정은 모두 Git을 통하여 기록을 남기도록합니다.
> 아무 생각 없이 완성 후 git에 push만 하였음. 크나큰 실책
- `외부 라이브러리를 사용할 수 없습니다`
    - Alamofire, Moya, Kingfisher 등 통신 관련 라이브러리도 **사용 불가**
    > UIKit URLSession 사용
    - SnapKit **사용 불가**
    > StoryBoard를 활용하여 구현
- 모든 화면은 오토레이아웃을 사용하여 레이아웃합니다.
    - UIKit 기반으로 UI를 구현하며, **SwiftUI는 사용할 수 없습니다**.
    > UIKit,StoryBoard 사용. 제약조건을 모두 설정함
- 모든 화면을 구현하지 못했더라도 제출해주세요.
    - 단, 제출 시기에 작성된 앱은 반드시 실행가능한 상태여야 합니다
    > 런치스크린, 첫번째, 두번째 화면 구현 및 실행성공




### 1. 런치스크린 및 네트워크 확인작업

- 날씨 앱은 반드시 네트워크가 연결 되어야만 하는 앱이다
  - 따라서 네트워크 모니터를 통해 앱 실행 시 네트워크 연결 확인이 필요하다 생각하였다.<br/>
  - 런치스크린을 보여줌과 동시에 네트워크 연결 확인이 필요하다.<br/>
  - ViewController를 새로 만들어 이를 해결한다.

#### 네트워크 모니터 활용
```swift
//  LaunchViewController.swift
override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !NetworkMonitor.shared.isConnected() {
            self.normalAlert(title: "", message: "네트워크 연결이 원활하지 않습니다\n연결상태를 확인 후 다시 시도해 주세요!")
            return
        }
        
        Thread.sleep(forTimeInterval: 1.0)
        branch()
    }
```
- 필요 데이터

도시이름, 날씨 아이콘, 현재기온, 현재습도

|데이터명|데이터타입|
|:---|:---|
|도시 이름|String|
|날씨 아이콘	|String|
|현재 기온	|Double|
|현재 습도	|Double|

#### 날씨 정보 Request

- 가져와야 하는 날씨정보는 총 20개이다.
- 20번의 호출을 하는 것 보다 필요한 도시 id 이용 한번에 호출하는 것이 더 낫다고 생각하였다.
- 사용한 url http://api.openweathermap.org/data/2.5/group?id=[id]&units;=metric
- 호출 후 테이블뷰를 리로드 시킨다.

```swift
//  WeatherViewController.swift
func requestWeather() {
        var cityNameList: String = ""
        
        for city in cityInfo {
            cityNameList += city.id + ","
        }
        cityNameList.removeLast()
        
        APIService.requestCityList(cityNameList) { weatherData, error in
            guard let weatherData = weatherData else {
                return
            }
            self.cityData = weatherData
            //도시의 총 개수
            self.cityCnt = self.cityData.cnt
            //테이블뷰 리로드
            self.WeatherTableView.reloadData()
        }
    }
```

#### 날씨 아이콘 Request

- Response 받은 날씨 아이콘 값을 파라미터로 아이콘을 요청한다.
- 캐싱을 활용한다.

```swift
extension UIImageView {
    
    func setImageUrl(_ url: String) {
            
            let cacheKey = NSString(string: url) // 캐시에 사용될 Key 값
            
            if let cachedImage = ImageCacheManager.shared.object(forKey: cacheKey) { // 해당 Key 에 캐시이미지가 저장되어 있으면 이미지를 사용
                self.image = cachedImage
                return
            }
            
        DispatchQueue.main.async {
                if let imageUrl = URL(string: url) {
                    URLSession.shared.dataTask(with: imageUrl) { (data, res, err) in
                        if let _ = err {
                            DispatchQueue.main.async {
                                self.image = UIImage()
                            }
                            return
                        }
                        DispatchQueue.main.async {
                            if let data = data, let image = UIImage(data: data) {
                                ImageCacheManager.shared.setObject(image, forKey: cacheKey) // 다운로드된 이미지를 캐시에 저장
                                self.image = image
                            }
                        }
                    }.resume()
                }
            }
        }
 }
 ```
 
 ### 3. 두번째 화면 - 날씨 상세 정보
 
 - 첫번째 화면 테이블뷰 셀을 선택할 시 상세정보 화면으로 이동한다.
 - 기본정보에 더하여 새로운 정보들이 추가된다.
 - 날씨 아이콘은 캐싱을 활용한다.
 - 추가 데이터
 
 체감기온, 최저기온, 최고기온, 기압, 풍속, 날씨설명

|데이터명|데이터타입|
|:---|:---|
|체감 기온|Double|
|최저 기온	|String|
|최고 기온	|Double|
|기압	|Double|
|풍속	|Double|
|날씨설명	|String|

 
