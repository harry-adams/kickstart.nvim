Keybindings Overview

This document summarizes the custom keybindings configured in Harry’s Neovim setup.

⸻

Global Keybindings

Mode	Key	Action
n	<Esc>	Clear search highlights
t	<Esc><Esc>	Exit terminal mode
n	<C-h>/<C-l>	Move between splits (left/right)
n	<C-j>/<C-k>	Move between splits (down/up)



⸻

Telescope (<leader>s)

Key	Action
<leader>sh	Help tags
<leader>sk	Keymaps
<leader>sf	Find files
<leader>ss	Telescope builtin
<leader>sw	Grep current word
<leader>sg	Grep (excluding tests)
<leader>st	Grep only in test files
<leader>sd	Search diagnostics
<leader>sr	Resume last Telescope search
<leader>s.	Recently opened files
<leader><leader>	Open buffers
<leader>/	Fuzzy find in current buffer
<leader>s/	Live grep open files
<leader>sn	Search in Neovim config



⸻

LSP

Key	Action
gd	Go to definition
gD	Go to declaration
gr	Go to references (Trouble)
gI	Go to implementation
<leader>D	Type definition
<leader>ds	Document symbols
<leader>ws	Workspace symbols
<leader>rn	Rename symbol
<leader>ca	Code action
<leader>th	Toggle inlay hints



⸻

LSP Preview (<leader>p)

Key	Action
<leader>pd	Preview definition
<leader>pi	Preview implementation
<leader>pt	Preview type definition
<leader>pC	Close all preview windows



⸻

Testing (<leader>t)

Key	Action
<leader>tt	Run nearest test
<leader>tf	Run current test file
<leader>td	Debug test (via DAP)
<leader>ts	Toggle test summary
<leader>to	Open test output
<leader>tp	Run pytest % manually



⸻

Trouble (<leader>x)

Key	Action
<leader>xx	Toggle diagnostics (workspace)
<leader>xX	Toggle buffer diagnostics
<leader>xL	Toggle location list
<leader>xQ	Toggle quickfix list



⸻

Comments & Linting

Key	Action
<leader>l	Lint current file
gcc / gc	Toggle line comment (normal/visual)
gbc / gb	Toggle block comment (normal/visual)



⸻

File Explorer

Key	Action
<leader>e	Open Oil file explorer in float



⸻

Test Output Navigation (Floating)

Key	Action
<Esc> (in output window)	Close the floating test output



⸻

Let me know if you’d like to customize or change any default mappings!
