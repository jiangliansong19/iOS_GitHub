import UIKit


func kweakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
    
    //元组记录下标和数组之和
    var result = [(Int, Int)]()
    for (index, value) in mat.enumerated() {
        result.append((index, value.reduce(0, +)))
    }
    
    //排序
    result = result.sorted(by: { (arg0, arg1) -> Bool in
        
        let (a1, a2) = arg0
        let (b1, b2) = arg1
        
        //如果a2 小于 b2
        if a2 < b2 {
            return true
        }
        
        //如果a2 = b2 且 a1 = b1
        if a1 == b1 && a2 == b2  {
            return true
        }
        return false;
    });
    
    //只取index
    return result.map{$0.0}
}

print("\(kweakestRows([[1,1,0,0,0],[1,0,0,0,0],[1,0,0,0,0],[1,1,1,0,0]], 2))")


