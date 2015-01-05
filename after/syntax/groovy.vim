" Cf - check a flag. Return true if the flag is specified.
function! Cf(flag)
    return exists('g:groovycoptions') && stridx(g:groovycoptions, a:flag) >= 0
endfunction

" we need the conceal feature (vim ≥ 7.3)
if exists('g:no_groovy_conceal') || !has('conceal') || &enc != 'utf-8'
    finish
endif

"syntax clear groovyOperator
syntax clear groovyBoolean 
syntax clear groovyConstant
syntax clear groovyType

syn keyword groovyType            boolean char byte short int long float double
"syn keyword groovyType            void
"syn keyword groovyType		  Integer Double Date Boolean Float String Array Vector List
syn keyword groovyType		  Double Boolean Float Vector 

syntax keyword groovyNiceStatement Closure conceal cchar=λ

" Variable Arguments
syntax match groovyNiceOperator "\.\@<!\.\.\.\.\@!" conceal cchar=⋯

" Range
syntax match grooyNiceOperator "\.\@<!\.\.\.\@!" conceal cchar=…

" Constants
syntax match groovyNull1 contained "\<n" conceal cchar= 
syntax match groovyNull2 contained "u" conceal cchar=⊥
syntax match groovyNull3 contained "ll\>" conceal cchar= 
syntax match groovyNull "\<null\>" contains=groovyNull1,groovyNull2,groovyNull3
"syntax match groovyNiceConstant "\<null\>" conceal cchar=⊥

syntax match groovyTrue1 contained "\<t" conceal cchar= 
syntax match groovyTrue2 contained "r" conceal cchar=𝐓
syntax match groovyTrue3 contained "ue\>" conceal cchar= 
syntax match groovyTrue "\<true\>" contains=groovyTrue1,groovyTrue2,groovyTrue3
"syntax match groovyNiceBoolean "\<true\>" conceal cchar=𝐓

syntax match groovyFalse1 contained "\<f" conceal cchar= 
syntax match groovyFalse2 contained "a" conceal cchar=𝐅
syntax match groovyFalse3 contained "lse\>" conceal cchar= 
syntax match groovyFalse "\<false\>" contains=groovyFalse1,groovyFalse2,groovyFalse3
"syntax match groovyNiceBoolean "\<false\>" conceal cchar=𝐅

" Comparisons
syntax match groovyNiceOperator "\s<=\s" conceal cchar=≤
syntax match groovyNiceOperator "\s>=\s" conceal cchar=≥
syntax match groovyNiceOperator "=\@<!===\@!" conceal cchar=≡
syntax match groovyNiceOperator "!=" conceal cchar=≢

" Boolean operations
syntax match groovyOr1 contained "\s|" conceal cchar=∨
syntax match groovyOr2 contained "|\s" conceal cchar= 
syntax match groovyOrFull "\s||\s" contains=groovyOr1,groovyOr2

syntax match groovyAnd1 contained "\s&" conceal cchar=∧
syntax match groovyAnd2 contained "&\s" conceal cchar= 
syntax match groovyAndFull "\s&&\s" contains=groovyAnd1,groovyAnd2

syntax match groovyNiceOperator "\s&&\s*!" conceal cchar=⊼
syntax match groovyNiceOperator "\s||\s*!" conceal cchar=⊽
syntax match groovyNiceOperator "\s^\s" conceal cchar=⊻
syntax match groovyNiceOperator "\<not\>" conceal cchar=¬
syntax match groovyNiceOperator "!" conceal cchar=¬ 

" Types
syntax match groovyNiceType "\<Boolean\>" conceal cchar=𝔹
syntax match groovyNiceType "\<Integer\>" conceal cchar=ℤ
syntax match groovyNiceType "\<Float\>" conceal cchar=ℜ

" Math
syntax match groovyNiceOperator "\<sum\>" conceal cchar=∑
syntax match groovyNiceOperator "\<product\>" conceal cchar=∏ 
syntax match groovyNiceOperator "\<pi\>" conceal cchar=π
syntax match groovyNiceOperator "\s\*\s" conceal cchar=⋅
syntax match groovyNiceOperator "\<multiply\>" conceal cchar=⋅
syntax match groovyNiceOperator "\s/\s" conceal cchar=÷
syntax match groovyNiceOperator "\<div\>" conceal cchar=÷
syntax match groovyNiceOperator "\<sqrt\>" conceal cchar=√

" Sets
syntax match groovyNiceOperator "\<in\>" conceal cchar=∈
syntax match groovyNiceOperator "\<contains\>" conceal cchar=∈

syntax match groovyEmptySet1 contained "\s+\[" conceal cchar=∅
syntax match groovyEmptySet2 contained "\]" conceal cchar= 
syntax match groovyEmptySetFull "\s+\[\]" contains=groovyEmptySet1,groovyEmptySet2

syntax match groovyEmptyMap1 contained "\[" conceal cchar=∅
syntax match groovyEmptyMap2 contained ":" conceal cchar=ₘ
syntax match groovyEmptyMap3 contained "\]" conceal cchar= 
syntax match groovyEmptyMapFull "\[:\]" contains=groovyEmptyMap1,groovyEmptyMap2,groovyEmptyMap3


" Closure parameter arrow
syntax match groovyLRArrowHead contained ">" conceal cchar= 
syntax match groovyLRArrowTail contained "-" conceal cchar=→
syntax match groovyLRArrowFull "->" contains=groovyLRArrowHead,groovyLRArrowTail

" Assignment arrow
syntax match groovyRLArrow1 contained "\s\+" conceal cchar= 
syntax match groovyRLArrow2 contained "=" conceal cchar=←
syntax match groovyRLArrow3 contained "\s\+" conceal cchar= 
syntax match groovyRLArrowFull "\s\+=\s\+" contains=groovyRLArrow1,groovyRLArrow2,groovyRLArrow3

" Operations
syntax match groovyNiceOperator "\<copyOf\>" conceal cchar=⊷
"syntax match groovyNiceOperator "\<clone\>" conceal cchar=⊷
"syntax match groovyNiceOperator "\<plus\>" conceal cchar=⊺ " Add to list
syntax match groovyNiceOperator "\s!\s*every\>" conceal cchar=∄
syntax match groovyNiceOperator "\severy\>" conceal cchar=∀
syntax match groovyNiceOperator "\<any\>" conceal cchar=∃
syntax match groovyNiceBuiltin "\<size\>" conceal cchar=#
"syntax match groovyNiceBuiltin "\<count\>" conceal cchar=#
syntax match groovyNiceOperator "\<join\>" conceal cchar=∪
syntax match groovyNiceOperator "\<intersection\>" conceal cchar=∩

" Map: ↦
syntax match groovyNiceOperator "\<collect\>" conceal cchar=↦
syntax match groovyNiceOperator "\<\*\.\>" conceal cchar=↦

" Filter
"syntax match groovyNiceOperator "\<inject\>" conceal cchar=↦

" Reduce
"syntax match groovyNiceOperator "\<findAll\>" conceal cchar=↦

" Misc
syntax match groovyVoid1 contained "\<v" conceal cchar= 
syntax match groovyVoid2 contained "o" conceal cchar=⊥
syntax match groovyVoid3 contained "id\>" conceal cchar= 
syntax match groovyVoid "\<void\>" contains=groovyVoid1,groovyVoid2,groovyVoid3

syntax match groovyArray1 contained "\<A" conceal cchar= 
syntax match groovyArray2 contained "r" conceal cchar=𝒜
syntax match groovyArray3 contained "rray\>" conceal cchar= 
syntax match groovyArray "\<Array\>" contains=groovyArray1,groovyArray2,groovyArray3
syntax match groovyList1 contained "\<L" conceal cchar= 
syntax match groovyList2 contained "i" conceal cchar=ℒ
syntax match groovyList3 contained "st\>" conceal cchar= 
syntax match groovyList "\<List\>" contains=groovyList1,groovyList2,groovyList3
" ℳ  Matrix
" Composition
if !Cf('R')
    " use the compose operator
    syntax match groovyCompose1 contained "\s<" conceal cchar=∘
    syntax match groovyCompose2 contained "<\s" conceal cchar= 
    syntax match groovyComposeFull "\s<<\s" contains=groovyCompose1,groovyCompose2
    " syntax match groovyNiceOperator "\s<<\s" conceal cchar=∘
else 
    syntax match groovyCompose3 contained "\s<" conceal cchar=«
    syntax match groovyCompose4 contained "<\s" conceal cchar= 
    syntax match groovyCompose2Full "\s<<\s" contains=groovyCompose3,groovyCompose4
    " syntax match groovyNiceOperator "\s<<\s" conceal cchar=«
endif
syntax match groovyNiceOperator "\s>>\s" conceal cchar=»

" Single character variable names usually indicate something generic and
" should be emphasized. eg 𝒇(𝒊)
" 's' Option to disable this.
if !Cf('s')
    syntax keyword groovyNiceStatement a conceal cchar=𝒂
    syntax keyword groovyNiceStatement b conceal cchar=𝒃
    syntax keyword groovyNiceStatement c conceal cchar=𝒄
    syntax keyword groovyNiceStatement d conceal cchar=𝒅
    syntax keyword groovyNiceStatement e conceal cchar=𝒆
    syntax keyword groovyNiceStatement f conceal cchar=𝒇
    syntax keyword groovyNiceStatement g conceal cchar=𝒈
    syntax keyword groovyNiceStatement h conceal cchar=𝒉
    syntax keyword groovyNiceStatement i conceal cchar=𝒊
    syntax keyword groovyNiceStatement j conceal cchar=𝒋
    syntax keyword groovyNiceStatement k conceal cchar=𝒌
    syntax keyword groovyNiceStatement l conceal cchar=𝒍
    syntax keyword groovyNiceStatement m conceal cchar=𝒎
    syntax keyword groovyNiceStatement n conceal cchar=𝒏
    syntax keyword groovyNiceStatement o conceal cchar=𝒐
    syntax keyword groovyNiceStatement p conceal cchar=𝒑
    syntax keyword groovyNiceStatement q conceal cchar=𝒒
    syntax keyword groovyNiceStatement r conceal cchar=𝒓
    syntax keyword groovyNiceStatement s conceal cchar=𝒔
    syntax keyword groovyNiceStatement t conceal cchar=𝒕
    syntax keyword groovyNiceStatement u conceal cchar=𝒖
    syntax keyword groovyNiceStatement v conceal cchar=𝒗
    syntax keyword groovyNiceStatement w conceal cchar=𝒘
    syntax keyword groovyNiceStatement x conceal cchar=𝒙
    syntax keyword groovyNiceStatement y conceal cchar=𝒚
    syntax keyword groovyNiceStatement z conceal cchar=𝒛

    syntax keyword groovyNiceStatement A conceal cchar=𝐀
    syntax keyword groovyNiceStatement B conceal cchar=𝐁
    syntax keyword groovyNiceStatement C conceal cchar=𝐂
    syntax keyword groovyNiceStatement D conceal cchar=𝐃
    syntax keyword groovyNiceStatement E conceal cchar=𝐄
    syntax keyword groovyNiceStatement F conceal cchar=𝐅
    syntax keyword groovyNiceStatement G conceal cchar=𝐆
    syntax keyword groovyNiceStatement H conceal cchar=𝐇
    syntax keyword groovyNiceStatement I conceal cchar=𝐈
    syntax keyword groovyNiceStatement J conceal cchar=𝐉
    syntax keyword groovyNiceStatement K conceal cchar=𝐊
    syntax keyword groovyNiceStatement L conceal cchar=𝐋
    syntax keyword groovyNiceStatement M conceal cchar=𝐌
    syntax keyword groovyNiceStatement N conceal cchar=𝐍
    syntax keyword groovyNiceStatement O conceal cchar=𝐎
    syntax keyword groovyNiceStatement P conceal cchar=𝐏
    syntax keyword groovyNiceStatement Q conceal cchar=𝐐
    syntax keyword groovyNiceStatement R conceal cchar=𝐑
    syntax keyword groovyNiceStatement S conceal cchar=𝐒
    syntax keyword groovyNiceStatement T conceal cchar=𝐓
    syntax keyword groovyNiceStatement U conceal cchar=𝐔
    syntax keyword groovyNiceStatement V conceal cchar=𝐕
    syntax keyword groovyNiceStatement W conceal cchar=𝐖
    syntax keyword groovyNiceStatement X conceal cchar=𝐗
    syntax keyword groovyNiceStatement Y conceal cchar=𝐘
    syntax keyword groovyNiceStatement Z conceal cchar=𝐙
endif

" Handle exponentiation
" '1' option to disable numeric superscripts concealing, e.g. x².
if !Cf('1')
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)0\>" conceal cchar=⁰
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)1\>" conceal cchar=¹
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)2\>" conceal cchar=²
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)3\>" conceal cchar=³
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)4\>" conceal cchar=⁴
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)5\>" conceal cchar=⁵
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)6\>" conceal cchar=⁶
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)7\>" conceal cchar=⁷
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)8\>" conceal cchar=⁸
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)9\>" conceal cchar=⁹
endif 

" 'a' option to disable alphabet superscripts concealing, e.g. xⁿ.
if !Cf('a')
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)a\>" conceal cchar=ᵃ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)b\>" conceal cchar=ᵇ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)c\>" conceal cchar=ᶜ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)d\>" conceal cchar=ᵈ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)e\>" conceal cchar=ᵉ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)f\>" conceal cchar=ᶠ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)g\>" conceal cchar=ᵍ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)h\>" conceal cchar=ʰ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)i\>" conceal cchar=ⁱ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)j\>" conceal cchar=ʲ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)k\>" conceal cchar=ᵏ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)l\>" conceal cchar=ˡ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)m\>" conceal cchar=ᵐ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)n\>" conceal cchar=ⁿ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)o\>" conceal cchar=ᵒ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)p\>" conceal cchar=ᵖ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)r\>" conceal cchar=ʳ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)s\>" conceal cchar=ˢ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)t\>" conceal cchar=ᵗ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)u\>" conceal cchar=ᵘ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)v\>" conceal cchar=ᵛ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)w\>" conceal cchar=ʷ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)x\>" conceal cchar=ˣ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)y\>" conceal cchar=ʸ
    syntax match groovyNiceOperator "\( \|\)\*\*\( \|\)z\>" conceal cchar=ᶻ
endif



" Fractions
" 'f' option to enables fractions
if !Cf('f')
    syntax keyword groovyNiceBuiltin 0.25 conceal cchar=¼
    syntax keyword groovyNiceBuiltin 0.5 conceal cchar=½
    syntax keyword groovyNiceBuiltin 0.75 conceal cchar=¾
    " ⅓ ¼ ⅕ ⅙ ⅛  ⅔ ⅖  ¾ ⅗ ⅜  ⅘  ⅚ ⅝a ⅞
" ¼   &frac14;    &#188;  &#xBC;
" VULGAR FRACTION 1/2 ½   &frac12;    &#189;  &#xBD;
" VULGAR FRACTION 3/4 ¾   &frac34;    &#190;  &#xBE;
" VULGAR FRACTION 1/3 ⅓   --  &#8531; &#x2153;
" VULGAR FRACTION 2/3 ⅔   --  &#8532; &#x2154;
" VULGAR FRACTION 1/5 ⅕   --  &#8533; &#x2155;
" VULGAR FRACTION 2/5 ⅖   --  &#8354; &#x2156;
" VULGAR FRACTION 3/5 ⅗   --  &#8535; &#x2157;
" VULGAR FRACTION 4/5 ⅘   --  &#8536; &#x2158;
" VULGAR FRACTION 1/6 ⅙   --  &#8537; &#x2159;
" VULGAR FRACTION 5/6 ⅚   --  &#8538; &#x215A;
" VULGAR FRACTION 1/8 ⅛   --  &#8539; &#x215B;
" VULGAR FRACTION 3/8 ⅜   --  &#8540; &#x215C;
" VULGAR FRACTION 5/8 ⅝   --  &#8541; &#x215D;
" VULGAR FRACTION 7/8 ⅞
endif 

" Map: ↦
" Floor: ⌊...⌋
" Ceil: ⌈...⌉
" Nearest Int: ⌊...⌉
" Proportional to: ∝

hi link groovyNiceOperator Operator
hi! link Conceal Operator

hi! Conceal ctermbg=Black ctermfg=LightGreen

setlocal conceallevel=2
setlocal concealcursor=nv

"   LEFT OUTER JOIN ⟕   
"   U+27D6  RIGHT OUTER JOIN    ⟖   
"   U+27D7  FULL OUTER JOIN ⟗
" Between ≬
"
