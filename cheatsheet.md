# TMUX

Leader commant: ctl + A

Switch panels: Leader/hold + o
Switch between panels: Leader + o

Show panels: Leader + w

## Resize panels (outsize of mac);

Leader > Ctrl [arrow]

## Find and replace

Find and replace in the hole file
:%s/foo/bar/g

## Edit serveral vertical lines

1. Enter Visual Mode (Ctrl + v)
2. Move along the lines to select the start of the character to Edit
3. Press I
4. Write (only the first line gets edited)
5. Press Esc

This doent seems to delete only change

## Find & replace in current line

1. Exit Insert Mode
2. Press / + search for term + Enter
3. Press [cgn] to replace first find
4. Enter Normal Mode + [n] to find next occurence
5. Press [.] (dot) to replance
6. Repeat
