# DOM

## 素のDOM
Document Object Model
ドム
HTMLなどを解no釈し、木構造で表したもの

昔はDOMを直接操作していた
レンダリングコスト増加、コードの複雑化

## 仮想DOM

JSのオブジェクトで仮想的に作られたDOM
いきなりDOMを操作せず、JS上で仮想DOMを操作し、差分をDOMに反映

仮想DOMは意識しなくてもよい　