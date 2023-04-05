#NoEnv
#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Settings
; Don't Change
global Result := "---"
global total_slot := 0


;  Guis
Gui, Font,, Yu Gothic UI
Gui, Add, Button, x12 y9 w600 h40 gGenerate, Generate
Gui, Add, Text, x12 y59 w45 h20, Result:
Gui, Add, Text, x57 y59 w550 h20, % Result
Gui, Add, Button, x12 y89 w90 h20 gResultCopy, Result Copy
; Generated using SmartGUI Creator 4.0
Gui, Show, h124 w623, BlackSmith ChestLoot Simulator v1.0.1 - ahk version
Return


; Subs
Generate:
    Result := ""
    total_slot := 0
    Random, rolls, 3, 8

    Loot(0, 14, rolls, "リンゴ", 1, 3)
    Loot(15, 29, rolls, "パン", 1, 3)
    Loot(30, 39, rolls, "鉄", 1, 5)
    Loot(40, 44, rolls, "苗木", 3, 7)
    Loot(45, 49, rolls, "黒曜石", 3, 7)
    Loot(50, 54, rolls, "金", 1, 3)
    Loot(55, 59, rolls, "鉄ピ", 1, 1)
    Loot(60, 64, rolls, "鉄剣", 1, 1)
    Loot(65, 69, rolls, "頭", 1, 1)
    Loot(70, 74, rolls, "チェスプレ", 1, 1)
    Loot(75, 79, rolls, "レギンス", 1, 1)
    Loot(80, 84, rolls, "ブーツ", 1, 1)
    Loot(85, 87, rolls, "ダイヤ", 1, 3)
    Loot(88, 90, rolls, "サドル", 1, 1)
    Loot(91, 91, rolls, "鉄馬鎧", 1, 1)
    Loot(92, 92, rolls, "金馬鎧", 1, 1)
    Loot(93, 93, rolls, "ダイヤ馬鎧", 1, 1)
    StringTrimRight, Result, Result, 1

    If (27 < total_slot)
        Result := "Error 1"

    Gui, Add, Text, x57 y59 w550 h20, % Result
    Gui, Submit
    Gui, Restore
Return


ResultCopy:
    Clipboard = % Result
Return


; ChestLoot Function
Loot(minweight, maxweight, count, itemname, minstack, maxstack) {
    While, l < count {
        l += 1
        Random, weight, 0, 93
        If (minweight <= weight and weight <= maxweight) {
            Random, itemstacks, minstack, maxstack
            remainingitems := itemstacks
            IfNotInString, lootitem, %itemname%, {
                lootitem = % lootitem itemname
            }          
            While, 0 < remainingitems {
                Random, split, 1, remainingitems
                lootitem = %lootitem%%split%, D
                lootitem := RTrim(lootitem, "D")
                remainingitems -= split
                total_slot += 1
            }
        }
    }
    StringRight, var, lootitem, 2
    If (var = ", ") {
        lootitem := RTrim(lootitem, " ,")
        lootitem = %lootitem%、
    }
    Result = % Result lootitem
}
