/**
 * File: PrintUtil.swift
 * Created Time: 2023-01-02
 * Author: nuomi1 (nuomi1@qq.com)
 */

public enum PrintUtil {
    private class Trunk {
        var prev: Trunk?
        var str: String

        init(prev: Trunk?, str: String) {
            self.prev = prev
            self.str = str
        }
    }

    public static func printLinkedList(head: ListNode) {
        var head: ListNode? = head
        var list: [String] = []
        while head != nil {
            list.append("\(head!.val)")
            head = head?.next
        }
        print(list.joined(separator: " -> "))
    }

    public static func printTree(root: TreeNode?) {
        printTree(root: root, prev: nil, isLeft: false)
    }

    private static func printTree(root: TreeNode?, prev: Trunk?, isLeft: Bool) {
        if root == nil {
            return
        }

        var prevStr = "    "
        let trunk = Trunk(prev: prev, str: prevStr)

        printTree(root: root?.right, prev: trunk, isLeft: true)

        if prev == nil {
            trunk.str = "———"
        } else if isLeft {
            trunk.str = "/———"
            prevStr = "   |"
        } else {
            trunk.str = "\\———"
            prev?.str = prevStr
        }

        showTrunks(p: trunk)
        print(" \(root!.val)")

        if prev != nil {
            prev?.str = prevStr
        }
        trunk.str = "   |"

        printTree(root: root?.left, prev: trunk, isLeft: false)
    }

    private static func showTrunks(p: Trunk?) {
        if p == nil {
            return
        }

        showTrunks(p: p?.prev)
        print(p!.str, terminator: "")
    }

    public static func printHashMap<K, V>(map: [K: V]) {
        for (key, value) in map {
            print("\(key) -> \(value)")
        }
    }

    public static func printHeap(queue: [Int]) {
        print("堆的数组表示：", terminator: "")
        print(queue)
        print("堆的树状表示：")
        let root = TreeNode.listToTree(list: queue)
        printTree(root: root)
    }
}
