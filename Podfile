# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'RxPagerView' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for RxPagerView
  pod 'FSPagerView'
  pod 'RxCocoa'
  
  target 'RxPagerViewTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  target 'RxPagerViewUITests' do
    # Pods for testing
  end
  
end

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
