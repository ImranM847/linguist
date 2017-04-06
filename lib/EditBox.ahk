EditBox(Text, Title="", Timeout=0, Permanent=False, GUIOptions="Resize MaximizeBox Minsize420x320", ControlOptions="VScroll W400 H300", Margin=10) {
    ;AutoHotkey_L 1.1.04+
    ;Timeout : The seconds to make the edit window disappear. 
    ;Permanent : if this is True, closing the GUI window does not destroy it but it is hidden.
    ;Return Value: the handle of the created window(Hwnd).
    
    Static EditBoxInfo := [], WindowHideStack := []    
    Gui, New, LabelEditBox HWNDHwndEdit %GUIOptions%, % Title     ;v1.1.04+
    Gui, Margin, %Margin%, %Margin%
    Gui, Add, Edit, HwndHwndEditControl %ControlOptions%, % Text
    ControlFocus,, ahk_id %HwndEditControl% 
    Gui, Show
    If Timeout {
        WindowHideStack[A_TickCount + Timeout * 1000] := HwndEdit
        SetTimer, EditBoxClose, % Timeout * -1 * 1000
    }
    EditBoxInfo[HwndEdit] := { HwndWindow : HwndEdit, Margin : Margin, HwndEditControl : HwndEditControl }
Return HwndEdit

    EditBoxSize:
        If (A_EventInfo = 1)  ; The window has been minimized.  No action needed.
            Return
        GuiControl, Move, % EditBoxInfo[Trim(A_GUI)].HwndEditControl
                  , % "H" (A_GuiHeight - EditBoxInfo[A_GUI].margin * 2) " W" ( A_GuiWidth - EditBoxInfo[A_GUI].margin * 2)
    Return
    EditBoxEscape:
    EditBoxClose:
        if (HwndEdit := WindowHideStack.Remove(WindowHideStack.MinIndex(), "")) { ;this means it's called from the timer, so the least index is removed
            if (NextTimer := WindowHideStack.MinIndex())        ;this means a next timer exists
                SetTimer,, % A_TickCount - NextTimer < 0 ? A_TickCount - NextTimer : -1        ;v1.1.01+
        } else
            HwndEdit := EditBoxInfo[A_GUI].HwndWindow
        if !Permanent {
            Gui, %HwndEdit%:Destroy
            EditBoxInfo.Remove(HwndEdit, "")
        } else
            Gui, %HwndEdit%:Hide
    Return
}