# ```
# Round {"first" "second" "third"}
# # or
# Parens {"first" "second" "third"}
# # ⎛first ⎞\n
# # ⎜second⎟\n
# # ⎝third ⎠
# ```
# ? Lines
Round ← (
  ⬚@ ≡°□ # pad lines
  ⊸⧻
  ⍣(⍩⋅"()" °0     # zero lines
  | ⍩($"(_)"⊢) °1 # one line
  |               # multiple lines 
    ⋅⊃(
      ¤$"⎛_⎞"⊢
    | =₀⊸⧻ ↘₋₁↘₁
      ⨬≡$"⎜_⎟" ""
    | ¤$"⎝_⎠"⊣
    )
    /$"_\n_"⊂₃
  )
)

# ```
# Square {"first" "second" "third"}
# # or
# Brackets {"first" "second" "third"}
# # ⎡first ⎤\n
# # ⎢second⎥\n
# # ⎣third ⎦
# ```
# ? Lines
Square ← (
  ⬚@ ≡°□ # pad lines

  ⍣(⍩⋅"[]" °0     # zero lines
  | ⍩($"[_]"⊢) °1 # single line
  | ⋅⊃(
      ¤$"⎡_⎤"⊢
    | =₀⊸⧻ ↘₋₁↘₁
      ⨬≡$"⎢_⎥" ""
    | ¤$"⎣_⎦"⊣)
    /$"_\n_"⊂₃
  )⊸⧻
)

# ```
# Curly {"first" "second" "third"}
# # or
# Braces {"first" "second" "third"}
# # ⎧first ⎫\n
# # ⎨second⎬\n
# # ⎩third ⎭
# ```
# ? Curly
Curly ← (
  ⬚@ ≡°□ # pad lines

  ⍣(⍩⋅"{}" °0     # zero lines
  | ⍩($"{_}"⊢) °1 # single line
  | ⍩(            # two lines
      ⊃($"⎰_⎱"⊢
      | $"⎱_⎰"⊣)
      $"_\n_"
    ) °2
  | # 3+ lines
    ⋅⊃(
      ¤$"⎧_⎫"⊢
    | ≡$"⎪_⎪"↘₋₁↘₁
      # insert middle segment
      ⍜⊡($"⎨_⎬"↘₋₁↘₁) -₁⌈÷₂⊸⧻
    | ¤$"⎩_⎭"⊣)
    /$"_\n_"⊂₃
  )⊸⧻
)

# Aliases

Parens   ← Round
Brackets ← Square
Braces   ← Curly

┌╶╶Test
  I₀ ← {}
  I₁ ← {"test one line"}
  I₂ ← {"test two" "lines"}
  I₃ ← {"test" "three" "lines"}
  I₄ ← {"test" "three" "+1" "lines"}
  I₅ ← {"and" "finally" "test" "five" "lines"}

  Round I₀
  ⍤⤙≍ "()"
  Round I₁
  ⍤⤙≍ "(test one line)"
  Round I₂
  ⍤⤙≍ $ ⎛test two⎞
      $ ⎝lines   ⎠
  Round I₃
  ⍤⤙≍ $ ⎛test ⎞
      $ ⎜three⎟
      $ ⎝lines⎠
  Round I₄
  ⍤⤙≍ $ ⎛test ⎞
      $ ⎜three⎟
      $ ⎜+1   ⎟
      $ ⎝lines⎠
  Round I₅
  ⍤⤙≍ $ ⎛and    ⎞
      $ ⎜finally⎟
      $ ⎜test   ⎟
      $ ⎜five   ⎟
      $ ⎝lines  ⎠

  Square I₀
  ⍤⤙≍ "[]"
  Square I₁
  ⍤⤙≍ "[test one line]"
  Square I₂
  ⍤⤙≍ $ ⎡test two⎤
      $ ⎣lines   ⎦
  Square I₃
  ⍤⤙≍ $ ⎡test ⎤
      $ ⎢three⎥
      $ ⎣lines⎦
  Square I₄
  ⍤⤙≍ $ ⎡test ⎤
      $ ⎢three⎥
      $ ⎢+1   ⎥
      $ ⎣lines⎦

  Curly I₀
  ⍤⤙≍ "{}"
  Curly I₁
  ⍤⤙≍ "{test one line}"
  Curly I₂
  ⍤⤙≍ $ ⎰test two⎱
      $ ⎱lines   ⎰
  Curly I₃
  ⍤⤙≍ $ ⎧test ⎫
      $ ⎨three⎬
      $ ⎩lines⎭
  Curly I₄
  ⍤⤙≍ $ ⎧test ⎫
      $ ⎨three⎬
      $ ⎪+1   ⎪
      $ ⎩lines⎭
  Curly I₅
  ⍤⤙≍ $ ⎧and    ⎫
      $ ⎪finally⎪
      $ ⎨test   ⎬
      $ ⎪five   ⎪
      $ ⎩lines  ⎭
└╶╶
