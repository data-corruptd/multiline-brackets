Parens ← (
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

Brackets ← (
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

Braces ← (
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

┌╶╶Test
  I₀ ← {}
  I₁ ← {"test one line"}
  I₂ ← {"test two" "lines"}
  I₃ ← {"test" "three" "lines"}
  I₄ ← {"test" "three" "+1" "lines"}
  I₅ ← {"and" "finally" "test" "five" "lines"}

  Parens I₀
  ⍤⤙≍ "()"
  Parens I₁
  ⍤⤙≍ "(test one line)"
  Parens I₂
  ⍤⤙≍ $ ⎛test two⎞
      $ ⎝lines   ⎠
  Parens I₃
  ⍤⤙≍ $ ⎛test ⎞
      $ ⎜three⎟
      $ ⎝lines⎠
  Parens I₄
  ⍤⤙≍ $ ⎛test ⎞
      $ ⎜three⎟
      $ ⎜+1   ⎟
      $ ⎝lines⎠
  Parens I₅
  ⍤⤙≍ $ ⎛and    ⎞
      $ ⎜finally⎟
      $ ⎜test   ⎟
      $ ⎜five   ⎟
      $ ⎝lines  ⎠

  Brackets I₀
  ⍤⤙≍ "[]"
  Brackets I₁
  ⍤⤙≍ "[test one line]"
  Brackets I₂
  ⍤⤙≍ $ ⎡test two⎤
      $ ⎣lines   ⎦
  Brackets I₃
  ⍤⤙≍ $ ⎡test ⎤
      $ ⎢three⎥
      $ ⎣lines⎦
  Brackets I₄
  ⍤⤙≍ $ ⎡test ⎤
      $ ⎢three⎥
      $ ⎢+1   ⎥
      $ ⎣lines⎦

  Braces I₀
  ⍤⤙≍ "{}"
  Braces I₁
  ⍤⤙≍ "{test one line}"
  Braces I₂
  ⍤⤙≍ $ ⎰test two⎱
      $ ⎱lines   ⎰
  Braces I₃
  ⍤⤙≍ $ ⎧test ⎫
      $ ⎨three⎬
      $ ⎩lines⎭
  Braces I₄
  ⍤⤙≍ $ ⎧test ⎫
      $ ⎨three⎬
      $ ⎪+1   ⎪
      $ ⎩lines⎭
  Braces I₅
  ⍤⤙≍ $ ⎧and    ⎫
      $ ⎪finally⎪
      $ ⎨test   ⎬
      $ ⎪five   ⎪
      $ ⎩lines  ⎭
└╶╶
