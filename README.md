# Article App. 

# Features

 - Home page : List all the most popular articles
 - Detailed page : Article properties, article link share option and article redading option from the url.
Using **xccov** command line tool we can view Xcode Code Coverage Reports.

# Technologies Used
- MVVM Architecture
- Swift 5
- SafariServices
- Kingfisher , Alamofire
- Object Oriented Approach
# Testing and Code Coverage Data
## Method 1(Using XCode)
1. Clone project from the url repository (https://github.com/shereenatk/Article.git)
2. open **Popular Article.xcworkspace**  in Xcode
3. open **Test Navigator**




![Screen Shot 2021-08-26 at 3 36 48 AM](https://user-images.githubusercontent.com/85651078/130878023-bf1a4257-273c-4a5e-813b-85507e0d4d99.png)



4. For testing click on **ᐅ** button near to each testcase class.
5. for getting coverage Data open **Report Navigator ** 



![Screen Shot 2021-08-26 at 3 42 55 AM](https://user-images.githubusercontent.com/85651078/130878402-2cb87218-864f-479c-ba13-f49217ff85cf.png)



## Method 2 (Using xccov)

Clone this repository and build an app from command line.

$ git clone  https://github.com/shereenatk/Article.git

$ cd Article

$ xcodebuild -workspace Popular\ Article.xcworkspace/ -scheme Popular\ Article -derivedDataPath Build/ -destination 'platform=iOS Simulator,OS=12.2,name=iPhone Xʀ' -enableCodeCoverage YES clean build test CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO


We can use xccov command line tool with xcrun untility .


