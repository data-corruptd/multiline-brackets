# ```
# RoundBrackets {"first" "second" "third"}
# ## ╭─
# ## ╷ "⎛first ⎞"
# ##   "⎜second⎟"
# ##   "⎝third ⎠"
# ##             ╯
# ```
# ? Lines
RoundBrackets ← (
  ⬚@ ≡°□ # pad lines
  ⊸⧻
  ⍣(⍩⋅(¤"()") °0   # zero lines
  | ⍩(¤$"(_)"⊢) °1 # one line
  |                # multiple lines 
    ⋅⊃(
      ¤$"⎛_⎞"⊢
    | =₀⊸⧻ ↘₋₁↘₁
      ⨬≡$"⎜_⎟" ""
    | ¤$"⎝_⎠"⊣
    )
    ⊂₃
  )
)
# Same as `RoundBrackets`, but joins the lines
# ? Lines
RoundBrackets′ ← /$"_\n_" RoundBrackets

# ```
# SquareBrackets {"first" "second" "third"}
# ## ╭─
# ## ╷ "⎡first ⎤"
# ##   "⎢second⎥"
# ##   "⎣third ⎦"
# ##              ╯
# ```
# ? Lines
SquareBrackets ← (
  ⬚@ ≡°□ # pad lines

  ⍣(⍩⋅(¤"[]") °0   # zero lines
  | ⍩(¤$"[_]"⊢) °1 # single line
  | ⋅⊃(
      ¤$"⎡_⎤"⊢
    | =₀⊸⧻ ↘₋₁↘₁
      ⨬≡$"⎢_⎥" ""
    | ¤$"⎣_⎦"⊣)
    ⊂₃
  )⊸⧻
)

# ```
# CurlyBrackets {"first" "second" "third"}
# ## ╭─
# ## ╷ "⎧first ⎫"
# ##   "⎨second⎬"
# ##   "⎩third ⎭"
# ##              ╯
# ```
# ? CurlyBrackets
CurlyBrackets ← (
  ⬚@ ≡°□ # pad lines

  ⍣(⍩⋅(¤"{}") °0   # zero lines
  | ⍩(¤$"{_}"⊢) °1 # single line
  | ⍩(             # two lines
      ⊃[$"⎰_⎱"⊢
      | $"⎱_⎰"⊣]
    ) °2
  | # 3+ lines
    ⋅⊃(
      ¤$"⎧_⎫"⊢
    | ≡$"⎪_⎪"↘₋₁↘₁
      # insert middle segment
      ⍜⊡($"⎨_⎬"↘₋₁↘₁) -₁⌈÷₂⊸⧻
    | ¤$"⎩_⎭"⊣)
    ⊂₃
  )⊸⧻
)

# Aliases

Parens   ← RoundBrackets
Brackets ← SquareBrackets
Braces   ← CurlyBrackets

┌╶╶Test
  I₀ ← {}
  I₁ ← {"test one line"}
  I₂ ← {"test two" "lines"}
  I₃ ← {"test" "three" "lines"}
  I₄ ← {"test" "three" "+1" "lines"}
  I₅ ← {"and" "finally" "test" "five" "lines"}

  RoundBrackets I₀
  ⍤⤙≍ ["()"]
  RoundBrackets I₁
  ⍤⤙≍ ["(test one line)"]
  RoundBrackets I₂
  ⍤⤙≍ ["⎛test two⎞"
       "⎝lines   ⎠"]
  RoundBrackets I₃
  ⍤⤙≍ ["⎛test ⎞"
       "⎜three⎟"
       "⎝lines⎠"]
  RoundBrackets I₄
  ⍤⤙≍ ["⎛test ⎞"
       "⎜three⎟"
       "⎜+1   ⎟"
       "⎝lines⎠"]
  RoundBrackets I₅
  ⍤⤙≍ ["⎛and    ⎞"
       "⎜finally⎟"
       "⎜test   ⎟"
       "⎜five   ⎟"
       "⎝lines  ⎠"]

  SquareBrackets I₀
  ⍤⤙≍ ["[]"]
  SquareBrackets I₁
  ⍤⤙≍ ["[test one line]"]
  SquareBrackets I₂
  ⍤⤙≍ ["⎡test two⎤"
       "⎣lines   ⎦"]
  SquareBrackets I₃
  ⍤⤙≍ ["⎡test ⎤"
       "⎢three⎥"
       "⎣lines⎦"]
  SquareBrackets I₄
  ⍤⤙≍ ["⎡test ⎤"
       "⎢three⎥"
       "⎢+1   ⎥"
       "⎣lines⎦"]

  CurlyBrackets I₀
  ⍤⤙≍ ["{}"]
  CurlyBrackets I₁
  ⍤⤙≍ ["{test one line}"]
  CurlyBrackets I₂
  ⍤⤙≍ ["⎰test two⎱"
       "⎱lines   ⎰"]
  CurlyBrackets I₃
  ⍤⤙≍ ["⎧test ⎫"
       "⎨three⎬"
       "⎩lines⎭"]
  CurlyBrackets I₄
  ⍤⤙≍ ["⎧test ⎫"
       "⎨three⎬"
       "⎪+1   ⎪"
       "⎩lines⎭"]
  CurlyBrackets I₅
  ⍤⤙≍ ["⎧and    ⎫"
       "⎪finally⎪"
       "⎨test   ⎬"
       "⎪five   ⎪"
       "⎩lines  ⎭"]
└╶╶
SquareBrackets {"three"}
## ╭─            
## ╷ "[three]"   
##             ╯ 
CurlyBrackets {"three" "lines" "here"}
## ╭─            
## ╷ "⎧three⎫"   
##   "⎨lines⎬"   
##   "⎩here ⎭"   
##             ╯ 
