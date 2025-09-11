#!/usr/bin/env osascript

on run argv
    -- Handle path argument, default to current directory
    if (count of argv) > 0 then
        set targetPath to item 1 of argv
    else
        set targetPath to (do shell script "pwd")
    end if
    
    -- Activate Ghostty terminal
    tell application "Ghostty" to activate
    
    delay 0.5
    
    -- Work with System Events to simulate keyboard shortcuts
    tell application "System Events"
        -- Create first horizontal split (Cmd+D)
        keystroke "d" using command down
        
        delay 0.2
        
        -- Create second horizontal split (Cmd+D) to get 3 panes total
        keystroke "d" using command down
        
        delay 0.2
        
        -- Equalize panes
        keystroke "=" using {control down, command down}
        
        -- Navigate to center pane
        key code 123 using {command down, option down} -- Left arrow to center pane
        delay 0.2
        
        -- Run nvim in center pane
        keystroke "cd \"" & targetPath & "\" && nvim"
        keystroke return
        
        -- Navigate to third pane and set directory
        key code 124 using {command down, option down} -- Right arrow to third pane
        delay 0.1
        keystroke "cd \"" & targetPath & "\" && clear"
        keystroke return
    end tell
end run
