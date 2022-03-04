//
//  Note.swift
//  RxPagerView
//
//  Created by yangkejun on 2021/12/3.
//

// ⚠️ 特别提示: 你需要在`Podfile`加入下面注释的代码，用于修改`FSPagerView`内部代码
// 详情参考: https://github.com/yangKJ/RxPagerView/Podfile

// ⚠️ Note: You need to add the code commented below to 'Podfile' to modify the internal code of 'FSPagerView'
// Details reference: https://github.com/yangKJ/RxPagerView/Podfile



//post_install do |installer|
//  ## Fixed collectionView being internal
//  find_and_replace("./Pods/FSPagerView/Sources/FSPagerCollectionView.swift", "class FSPagerCollectionView", "public class FSPagerCollectionView")
//  find_and_replace("./Pods/FSPagerView/Sources/FSPagerCollectionView.swift", "override var scrollsToTop", "public override var scrollsToTop")
//  find_and_replace("./Pods/FSPagerView/Sources/FSPagerCollectionView.swift", "override var contentInset", "public override var contentInset")
//
//  find_and_replace("./Pods/FSPagerView/Sources/FSPagerView.swift", "internal weak var collectionView:", "public weak var collectionView:")
//  find_and_replace("./Pods/FSPagerView/Sources/FSPagerView.swift", "internal var numberOfItems:", "public var numberOfItems:")
//  find_and_replace("./Pods/FSPagerView/Sources/FSPagerView.swift", "internal var numberOfSections:", "public var numberOfSections:")
//end
//
//## 给Pod库修改代码
//def find_and_replace(dir, findstr, replacestr)
//  Dir[dir].each do |name|
//    text = File.read(name)
//    replace = text.gsub(findstr,replacestr)
//    if text != replace
//      puts "Fix: " + name
//      File.open(name, "w") { |file| file.puts replace }
//      STDOUT.flush
//    end
//  end
//  Dir[dir + '*/'].each(&method(:find_and_replace))
//end
