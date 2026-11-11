# Multiline Brackets

This is a small Uiua module for generating strings wrapped in multiline brackets.

## Installation
You can import this module using:
```ua
M ~ "git: github.com/data-corruptd/multiline-brackets"
```

## Overview

This module has three functions:

| Function         | Alias      | Signature | Ascii |
| ---------------- | ---------- | --------- | ----- |
| `RoundBrackets`  | `Parens`   | `1.1`     | `()`  |
| `SquareBrackets` | `Brackets` | `1.1`     | `[]`  |
| `CurlyBrackets`  | `Braces`   | `1.1`     | `{}`  |

## Examples
```ua
RoundBrackets {}
## "()" 

RoundBrackets {"one line"}
## "(one line)" 

RoundBrackets {"two" "lines"}
## ╭─            
## ╷ "⎛two  ⎞"   
##   "⎝lines⎠"   
##             ╯ 

RoundBrackets {"three" "lines" "here"}
## ╭─            
## ╷ "⎛three⎞"   
##   "⎜lines⎟"   
##   "⎝here ⎠"   
##             ╯ 

SquareBrackets {"three" "lines" "here"}
## ╭─            
## ╷ "⎡three⎤"   
##   "⎢lines⎥"   
##   "⎣here ⎦"   
##             ╯ 

CurlyBrackets {"three" "lines" "here"}
## ╭─            
## ╷ "⎧three⎫"   
##   "⎨lines⎬"   
##   "⎩here ⎭"   
##             ╯ 

```



