# RxPagerView

FSPagerView adds rx extension

### 使用用例

```
func setupBinding() {
    let datasObserver = Observable.just(["luoza", "nini", "xiong", "yu"])
    
    datasObserver.bind(to: pagerView.rx.items()) { (row, element, cell) in
        cell.imageView?.image = UIImage(named: element)
    }.disposed(by: disposeBag)
    
    datasObserver.map { $0.count }.bind(to: pageControl.rx.numberOfPages).disposed(by: disposeBag)
    
    pagerView.rx.didSelectItemAtIndex.subscribe(onNext: { index in
        debugPrint("Did select index: " + "\(index)")
    }).disposed(by: disposeBag)
    
    pagerView.rx.pagerViewDidScroll.subscribe(onNext: { [weak self] index in
        self?.pageControl.currentPage = index
    }).disposed(by: disposeBag)
}
```


### 特别提示
- 在使用之前，需要在`Podfile`加入下面代码，用于修改`FSPagerView`内部代码

```
post_install do |installer|
  ## Fixed collectionView being internal
  find_and_replace("./Pods/FSPagerView/Sources/FSPagerCollectionView.swift", "class FSPagerCollectionView", "public class FSPagerCollectionView")
  find_and_replace("./Pods/FSPagerView/Sources/FSPagerCollectionView.swift", "override var scrollsToTop", "public override var scrollsToTop")
  find_and_replace("./Pods/FSPagerView/Sources/FSPagerCollectionView.swift", "override var contentInset", "public override var contentInset")

  find_and_replace("./Pods/FSPagerView/Sources/FSPagerView.swift", "internal weak var collectionView:", "public weak var collectionView:")
  find_and_replace("./Pods/FSPagerView/Sources/FSPagerView.swift", "internal var numberOfItems:", "public var numberOfItems:")
  find_and_replace("./Pods/FSPagerView/Sources/FSPagerView.swift", "internal var numberOfSections:", "public var numberOfSections:")
end

## 给Pod库修改代码
def find_and_replace(dir, findstr, replacestr)
  Dir[dir].each do |name|
    text = File.read(name)
    replace = text.gsub(findstr,replacestr)
    if text != replace
      puts "Fix: " + name
      File.open(name, "w") { |file| file.puts replace }
      STDOUT.flush
    end
  end
  Dir[dir + '*/'].each(&method(:find_and_replace))
end
```