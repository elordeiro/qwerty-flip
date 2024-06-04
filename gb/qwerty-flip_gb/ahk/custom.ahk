﻿; Generated by KLFC 1.5.7
; https://github.com/39aldo39/klfc

#MaxHotkeysPerInterval 200
#MaxThreadsPerHotkey 10

SendUps(ByRef modifiers) {
  for index, modifier in modifiers {
    if (modifier == "Caps")
      SetCapsLockState, off
    else if (modifier == "Num")
      SetNumLockState, off
    else if InStr(modifier, "Extend")
      %modifier% := false
    else
      Send {%modifier% Up}
  }
  modifiers := Object()
}

SendAsUnicode(string) {
  Result := ""
  Loop, Parse, string
    Result .= Format("{{}U+{:04x}{}}", Ord(A_LoopField))
  Send {Blind}%Result%
}

DeadKeys := ComObjCreate("Scripting.Dictionary")

DeadKey(baseChar, table, name := "") {
  Global ActiveDeadKey
  if (ActiveDeadKey != "") {
    NewActiveDeadKey := ComObjCreate("Scripting.Dictionary")
    for key in table {
      value := table.item(key)
      NewActiveDeadKey.item(key) := ActiveDeadKey.item(value)
    }
    result := ActiveDeadKey.item(name)
    if (IsObject(result)) {
      for key in result {
        value := result.item(key)
        NewActiveDeadKey.item(key) := value
      }
    } else if (result != "") {
      ActiveDeadKey := ""
      SendAsUnicode(result)
      Return
    }
    ActiveDeadKey := NewActiveDeadKey
    Return
  }
  ActiveDeadKey := table
  Input key, L1, {Esc}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{PrintScreen}{Pause}{AppsKey}
  If InStr(ErrorLevel, "EndKey:") {
    ActiveDeadKey := ""
    value := SubStr(ErrorLevel, 8)
    Send {Blind}{%value%}
    SendAsUnicode(baseChar)
  } else if (ErrorLevel != "NewInput") {
    value := ActiveDeadKey.item(key)
    ActiveDeadKey := ""
    if (IsObject(value)) {
      DeadKey(baseChar, value)
    } else if (value != "") {
      SendAsUnicode(value)
    } else {
      SendAsUnicode(baseChar . key)
    }
  }
}

*SC029::Send {Blind}{VKc0SC029 DownR} ; QWERTY ~: ~
*SC029 up::Send {Blind}{VKc0SC029 Up}
*SC002::Send {Blind}{VK31SC002 DownR} ; QWERTY 1: 1
*SC002 up::Send {Blind}{VK31SC002 Up}
*SC003::Send {Blind}{VK32SC003 DownR} ; QWERTY 2: 2
*SC003 up::Send {Blind}{VK32SC003 Up}
*SC004::Send {Blind}{VK33SC004 DownR} ; QWERTY 3: 3
*SC004 up::Send {Blind}{VK33SC004 Up}
*SC005::Send {Blind}{VK34SC005 DownR} ; QWERTY 4: 4
*SC005 up::Send {Blind}{VK34SC005 Up}
*SC006::Send {Blind}{VK35SC006 DownR} ; QWERTY 5: 5
*SC006 up::Send {Blind}{VK35SC006 Up}
*SC007::Send {Blind}{VK36SC007 DownR} ; QWERTY 6: 6
*SC007 up::Send {Blind}{VK36SC007 Up}
*SC008::Send {Blind}{VK37SC008 DownR} ; QWERTY 7: 7
*SC008 up::Send {Blind}{VK37SC008 Up}
*SC009::Send {Blind}{VK38SC009 DownR} ; QWERTY 8: 8
*SC009 up::Send {Blind}{VK38SC009 Up}
*SC00a::Send {Blind}{VK39SC00a DownR} ; QWERTY 9: 9
*SC00a up::Send {Blind}{VK39SC00a Up}
*SC00b::Send {Blind}{VK30SC00b DownR} ; QWERTY 0: 0
*SC00b up::Send {Blind}{VK30SC00b Up}
*SC00c::Send {Blind}{VKbdSC00c DownR} ; QWERTY -: -
*SC00c up::Send {Blind}{VKbdSC00c Up}
*SC00d::Send {Blind}{VKbbSC00d DownR} ; QWERTY +: +
*SC00d up::Send {Blind}{VKbbSC00d Up}
*SC010::Send {Blind}{VK51SC010 DownR} ; QWERTY Q: Q
*SC010 up::Send {Blind}{VK51SC010 Up}
*SC011::Send {Blind}{VK57SC011 DownR} ; QWERTY W: W
*SC011 up::Send {Blind}{VK57SC011 Up}
*SC012::Send {Blind}{VK44SC012 DownR} ; QWERTY E: D
*SC012 up::Send {Blind}{VK44SC012 Up}
*SC013::Send {Blind}{VK46SC013 DownR} ; QWERTY R: F
*SC013 up::Send {Blind}{VK46SC013 Up}
*SC014::Send {Blind}{VK47SC014 DownR} ; QWERTY T: G
*SC014 up::Send {Blind}{VK47SC014 Up}
*SC015::Send {Blind}{VK59SC015 DownR} ; QWERTY Y: Y
*SC015 up::Send {Blind}{VK59SC015 Up}
*SC016::Send {Blind}{VK4aSC016 DownR} ; QWERTY U: J
*SC016 up::Send {Blind}{VK4aSC016 Up}
*SC017::Send {Blind}{VK4bSC017 DownR} ; QWERTY I: K
*SC017 up::Send {Blind}{VK4bSC017 Up}
*SC018::Send {Blind}{VK4cSC018 DownR} ; QWERTY O: L
*SC018 up::Send {Blind}{VK4cSC018 Up}
*SC019::Send {Blind}{VKbaSC019 DownR} ; QWERTY P: ;
*SC019 up::Send {Blind}{VKbaSC019 Up}
*SC01a::Send {Blind}{VKdbSC01a DownR} ; QWERTY [: [
*SC01a up::Send {Blind}{VKdbSC01a Up}
*SC01b::Send {Blind}{VKddSC01b DownR} ; QWERTY ]: ]
*SC01b up::Send {Blind}{VKddSC01b Up}
*SC01e::Send {Blind}{VK41SC01e DownR} ; QWERTY A: A
*SC01e up::Send {Blind}{VK41SC01e Up}
*SC01f::Send {Blind}{VK53SC01f DownR} ; QWERTY S: S
*SC01f up::Send {Blind}{VK53SC01f Up}
*SC020::Send {Blind}{VK45SC020 DownR} ; QWERTY D: E
*SC020 up::Send {Blind}{VK45SC020 Up}
*SC021::Send {Blind}{VK52SC021 DownR} ; QWERTY F: R
*SC021 up::Send {Blind}{VK52SC021 Up}
*SC022::Send {Blind}{VK54SC022 DownR} ; QWERTY G: T
*SC022 up::Send {Blind}{VK54SC022 Up}
*SC023::Send {Blind}{VK48SC023 DownR} ; QWERTY H: H
*SC023 up::Send {Blind}{VK48SC023 Up}
*SC024::Send {Blind}{VK55SC024 DownR} ; QWERTY J: U
*SC024 up::Send {Blind}{VK55SC024 Up}
*SC025::Send {Blind}{VK49SC025 DownR} ; QWERTY K: I
*SC025 up::Send {Blind}{VK49SC025 Up}
*SC026::Send {Blind}{VK4fSC026 DownR} ; QWERTY L: O
*SC026 up::Send {Blind}{VK4fSC026 Up}
*SC027::Send {Blind}{VK50SC027 DownR} ; QWERTY ;: P
*SC027 up::Send {Blind}{VK50SC027 Up}
*SC028::Send {Blind}{VKdeSC028 DownR} ; QWERTY ': '
*SC028 up::Send {Blind}{VKdeSC028 Up}
*SC02b::Send {Blind}{VKdcSC02b DownR} ; QWERTY \: \
*SC02b up::Send {Blind}{VKdcSC02b Up}
*SC056::Send {Blind}{VKdcSC056 DownR} ; QWERTY Iso: \
*SC056 up::Send {Blind}{VKdcSC056 Up}
*SC02c::Send {Blind}{VK5aSC02c DownR} ; QWERTY Z: Z
*SC02c up::Send {Blind}{VK5aSC02c Up}
*SC02d::Send {Blind}{VK58SC02d DownR} ; QWERTY X: X
*SC02d up::Send {Blind}{VK58SC02d Up}
*SC02e::Send {Blind}{VK43SC02e DownR} ; QWERTY C: C
*SC02e up::Send {Blind}{VK43SC02e Up}
*SC02f::Send {Blind}{VK56SC02f DownR} ; QWERTY V: V
*SC02f up::Send {Blind}{VK56SC02f Up}
*SC030::Send {Blind}{VK42SC030 DownR} ; QWERTY B: B
*SC030 up::Send {Blind}{VK42SC030 Up}
*SC031::Send {Blind}{VK4eSC031 DownR} ; QWERTY N: N
*SC031 up::Send {Blind}{VK4eSC031 Up}
*SC032::Send {Blind}{VK4dSC032 DownR} ; QWERTY M: M
*SC032 up::Send {Blind}{VK4dSC032 Up}
*SC033::Send {Blind}{VKbcSC033 DownR} ; QWERTY ,: ,
*SC033 up::Send {Blind}{VKbcSC033 Up}
*SC034::Send {Blind}{VKbeSC034 DownR} ; QWERTY .: .
*SC034 up::Send {Blind}{VKbeSC034 Up}
*SC035::Send {Blind}{VKbfSC035 DownR} ; QWERTY /: /
*SC035 up::Send {Blind}{VKbfSC035 Up}

; QWERTY ~
#if
SC029::Send {Blind}{U+0060} ; `
+SC029::Send {Blind}{U+00ac} ; ¬
>!<^SC029::Send {Blind}{U+00a6} ; ¦

; QWERTY 1
#if
SC002::Send {Blind}{U+0031} ; 1
+SC002::Send {Blind}{U+0021} ; !

; QWERTY 2
#if
SC003::Send {Blind}{U+0032} ; 2
+SC003::Send {Blind}{U+0022} ; "

; QWERTY 3
#if
SC004::Send {Blind}{U+0033} ; 3
+SC004::Send {Blind}{U+00a3} ; £

; QWERTY 4
#if
SC005::Send {Blind}{U+0034} ; 4
+SC005::Send {Blind}{U+0024} ; $
>!<^SC005::Send {Blind}{U+20ac} ; €

; QWERTY 5
#if
SC006::Send {Blind}{U+0035} ; 5
+SC006::Send {Blind}{U+0025} ; %

; QWERTY 6
#if
SC007::Send {Blind}{U+0036} ; 6
+SC007::Send {Blind}{U+005e} ; ^

; QWERTY 7
#if
SC008::Send {Blind}{U+0037} ; 7
+SC008::Send {Blind}{U+0026} ; &

; QWERTY 8
#if
SC009::Send {Blind}{U+0038} ; 8
+SC009::Send {Blind}{U+002a} ; *

; QWERTY 9
#if
SC00a::Send {Blind}{U+0039} ; 9
+SC00a::Send {Blind}{U+0028} ; (

; QWERTY 0
#if
SC00b::Send {Blind}{U+0030} ; 0
+SC00b::Send {Blind}{U+0029} ; )

; QWERTY -
#if
SC00c::Send {Blind}{U+002d} ; -
+SC00c::Send {Blind}{U+005f} ; _

; QWERTY +
#if
SC00d::Send {Blind}{U+003d} ; =
+SC00d::Send {Blind}{U+002b} ; +

; QWERTY Q
#if
SC010::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0071} ; q
} else {
  Send {Blind}{U+0051} ; Q
}
Return
+SC010::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0051} ; Q
} else {
  Send {Blind}{U+0071} ; q
}
Return

; QWERTY W
#if
SC011::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0077} ; w
} else {
  Send {Blind}{U+0057} ; W
}
Return
+SC011::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0057} ; W
} else {
  Send {Blind}{U+0077} ; w
}
Return

; QWERTY E
#if
SC012::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0064} ; d
} else {
  Send {Blind}{U+0044} ; D
}
Return
+SC012::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0044} ; D
} else {
  Send {Blind}{U+0064} ; d
}
Return

; QWERTY R
#if
SC013::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0066} ; f
} else {
  Send {Blind}{U+0046} ; F
}
Return
+SC013::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0046} ; F
} else {
  Send {Blind}{U+0066} ; f
}
Return

; QWERTY T
#if
SC014::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0067} ; g
} else {
  Send {Blind}{U+0047} ; G
}
Return
+SC014::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0047} ; G
} else {
  Send {Blind}{U+0067} ; g
}
Return

; QWERTY Y
#if
SC015::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0079} ; y
} else {
  Send {Blind}{U+0059} ; Y
}
Return
+SC015::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0059} ; Y
} else {
  Send {Blind}{U+0079} ; y
}
Return

; QWERTY U
#if
SC016::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+006a} ; j
} else {
  Send {Blind}{U+004a} ; J
}
Return
+SC016::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+004a} ; J
} else {
  Send {Blind}{U+006a} ; j
}
Return

; QWERTY I
#if
SC017::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+006b} ; k
} else {
  Send {Blind}{U+004b} ; K
}
Return
+SC017::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+004b} ; K
} else {
  Send {Blind}{U+006b} ; k
}
Return

; QWERTY O
#if
SC018::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+006c} ; l
} else {
  Send {Blind}{U+004c} ; L
}
Return
+SC018::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+004c} ; L
} else {
  Send {Blind}{U+006c} ; l
}
Return

; QWERTY P
#if
SC019::Send {Blind}{U+003b} ; ;
+SC019::Send {Blind}{U+003a} ; :

; QWERTY [
#if
SC01a::Send {Blind}{U+005b} ; [
+SC01a::Send {Blind}{U+007b} ; {

; QWERTY ]
#if
SC01b::Send {Blind}{U+005d} ; ]
+SC01b::Send {Blind}{U+007d} ; }

; QWERTY A
#if
SC01e::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0061} ; a
} else {
  Send {Blind}{U+0041} ; A
}
Return
+SC01e::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0041} ; A
} else {
  Send {Blind}{U+0061} ; a
}
Return

; QWERTY S
#if
SC01f::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0073} ; s
} else {
  Send {Blind}{U+0053} ; S
}
Return
+SC01f::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0053} ; S
} else {
  Send {Blind}{U+0073} ; s
}
Return

; QWERTY D
#if
SC020::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0065} ; e
} else {
  Send {Blind}{U+0045} ; E
}
Return
+SC020::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0045} ; E
} else {
  Send {Blind}{U+0065} ; e
}
Return

; QWERTY F
#if
SC021::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0072} ; r
} else {
  Send {Blind}{U+0052} ; R
}
Return
+SC021::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0052} ; R
} else {
  Send {Blind}{U+0072} ; r
}
Return

; QWERTY G
#if
SC022::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0074} ; t
} else {
  Send {Blind}{U+0054} ; T
}
Return
+SC022::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0054} ; T
} else {
  Send {Blind}{U+0074} ; t
}
Return

; QWERTY H
#if
SC023::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0068} ; h
} else {
  Send {Blind}{U+0048} ; H
}
Return
+SC023::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0048} ; H
} else {
  Send {Blind}{U+0068} ; h
}
Return

; QWERTY J
#if
SC024::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0075} ; u
} else {
  Send {Blind}{U+0055} ; U
}
Return
+SC024::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0055} ; U
} else {
  Send {Blind}{U+0075} ; u
}
Return

; QWERTY K
#if
SC025::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0069} ; i
} else {
  Send {Blind}{U+0049} ; I
}
Return
+SC025::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0049} ; I
} else {
  Send {Blind}{U+0069} ; i
}
Return

; QWERTY L
#if
SC026::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+006f} ; o
} else {
  Send {Blind}{U+004f} ; O
}
Return
+SC026::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+004f} ; O
} else {
  Send {Blind}{U+006f} ; o
}
Return

; QWERTY ;
#if
SC027::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0070} ; p
} else {
  Send {Blind}{U+0050} ; P
}
Return
+SC027::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0050} ; P
} else {
  Send {Blind}{U+0070} ; p
}
Return

; QWERTY '
#if
SC028::Send {Blind}{U+0027} ; '
+SC028::Send {Blind}{U+0040} ; @

; QWERTY \
#if
SC02b::Send {Blind}{U+0023} ; #
+SC02b::Send {Blind}{U+007e} ; ~

; QWERTY Iso
#if
SC056::Send {Blind}{U+005c} ; \
+SC056::Send {Blind}{U+007c} ; |

; QWERTY Z
#if
SC02c::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+007a} ; z
} else {
  Send {Blind}{U+005a} ; Z
}
Return
+SC02c::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+005a} ; Z
} else {
  Send {Blind}{U+007a} ; z
}
Return

; QWERTY X
#if
SC02d::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0078} ; x
} else {
  Send {Blind}{U+0058} ; X
}
Return
+SC02d::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0058} ; X
} else {
  Send {Blind}{U+0078} ; x
}
Return

; QWERTY C
#if
SC02e::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0063} ; c
} else {
  Send {Blind}{U+0043} ; C
}
Return
+SC02e::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0043} ; C
} else {
  Send {Blind}{U+0063} ; c
}
Return

; QWERTY V
#if
SC02f::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0076} ; v
} else {
  Send {Blind}{U+0056} ; V
}
Return
+SC02f::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0056} ; V
} else {
  Send {Blind}{U+0076} ; v
}
Return

; QWERTY B
#if
SC030::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0062} ; b
} else {
  Send {Blind}{U+0042} ; B
}
Return
+SC030::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+0042} ; B
} else {
  Send {Blind}{U+0062} ; b
}
Return

; QWERTY N
#if
SC031::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+006e} ; n
} else {
  Send {Blind}{U+004e} ; N
}
Return
+SC031::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+004e} ; N
} else {
  Send {Blind}{U+006e} ; n
}
Return

; QWERTY M
#if
SC032::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+006d} ; m
} else {
  Send {Blind}{U+004d} ; M
}
Return
+SC032::
if not GetKeyState("CapsLock", "T") {
  Send {Blind}{U+004d} ; M
} else {
  Send {Blind}{U+006d} ; m
}
Return

; QWERTY ,
#if
SC033::Send {Blind}{U+002c} ; ,
+SC033::Send {Blind}{U+003c} ; <

; QWERTY .
#if
SC034::Send {Blind}{U+002e} ; .
+SC034::Send {Blind}{U+003e} ; >

; QWERTY /
#if
SC035::Send {Blind}{U+002f} ; /
+SC035::Send {Blind}{U+003f} ; ?
