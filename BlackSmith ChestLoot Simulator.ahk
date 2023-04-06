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
    weight := []
    Result := ""
    total_slot := 0
    Random, rolls, 3, 8

    While A_Index <= rolls {
        Random, rnddummy, 0, 93
        weight[A_Index] := rnddummy
    }

    loot(weight, 0, 14, "リンゴ", 1, 3)
    loot(weight, 15, 29, "パン", 1, 3)
    loot(weight, 30, 39, "鉄", 1, 5)
    loot(weight, 40, 44, "苗木", 3, 7)
    loot(weight, 45, 49, "黒曜石", 3, 7)
    loot(weight, 50, 54, "金", 1, 3)
    loot(weight, 55, 59, "鉄ピ", 1, 1)
    loot(weight, 60, 64, "鉄剣", 1, 1)
    loot(weight, 65, 69, "頭", 1, 1)
    loot(weight, 70, 74, "チェスプレ", 1, 1)
    loot(weight, 75, 79, "レギンス", 1, 1)
    loot(weight, 80, 84, "ブーツ", 1, 1)
    loot(weight, 85, 87, "ダイヤ", 1, 3)
    loot(weight, 88, 90, "サドル", 1, 1)
    loot(weight, 91, 91, "鉄馬鎧", 1, 1)
    loot(weight, 92, 92, "金馬鎧", 1, 1)
    loot(weight, 93, 93, "ダイヤ馬鎧", 1, 1)
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
Loot(weight, minweight, maxweight, itemname, minstack, maxstack) {
    For dummy, weightdummy in weight {
        If (minweight <= weightdummy and weightdummy <= maxweight) {
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
