#!/bin/sh

tmp=/tmp/$$

# 異常出力一覧
echo "入力が2つではありません。もう一度実行してください。" > $tmp-args
echo "1つ目あるいは両方の入力が自然数ではありません。もう一度実行してください。" > $tmp-nat1
echo "1つ目の自然数は6です。
2つ目の入力が自然数ではありません。もう一度実行してください。" > $tmp-nat2

# 正常出力一覧
echo "1つ目の自然数は0です。
2つ目の自然数は9です。
2つの自然数のうちいずれかあるいは両方が0の場合、最大公約数は0です。" > $tmp-zero
echo "1つ目の自然数は6です。
2つ目の自然数は9です。
6と9の最大公約数は3です。" > $tmp-ok1
echo "1つ目の自然数は9です。
2つ目の自然数は18です。
9と18の最大公約数は9です。" > $tmp-ok2
echo "1つ目の自然数は9です。
2つ目の自然数は9です。
9と9の最大公約数は9です。" > $tmp-ok3

# エラーメッセージ出力
error_exit (){
        echo "$1" >&2
        rm -f $tmp-*
exit 1
}

# test 1-1: 異常系 引数の数が0
./kadai3.sh> $tmp-ans && error_exit "error in test 1-1a"
diff $tmp-ans $tmp-args || error_exit "error in test 1-1b"
echo test 1-1 OK

# test 1-2: 異常系 引数の数が1
./kadai3.sh 6 > $tmp-ans && error_exit "error in test 1-2a"
diff $tmp-ans $tmp-args || error_exit "error in test 1-2b"
echo test 1-2 OK

# test 1-3: 異常系 引数の数が3以上
./kadai3.sh 6 9 18 > $tmp-ans && error_exit "error in test 1-3a"
diff $tmp-ans $tmp-args || error_exit "error in test 1-3b"
echo test 1-3 OK

# test 2-1: 異常系 1つ目の入力が自然数ではない
./kadai3.sh -6 9 > $tmp-ans && error_exit "error in test 2-1a"
diff $tmp-ans $tmp-nat1 || error_exit "error in test 2-2b"
echo test 2-1 OK

# test 2-2: 異常系 1つ目の入力が文字列
./kadai3.sh abc 9 > $tmp-ans && error_exit "error in test 2-2a"
diff $tmp-ans $tmp-nat1 || error_exit "error in test 2-2b"
echo test 2-2 OK

# test 3-1: 異常系 2つ目の入力が自然数ではない
./kadai3.sh 6 0.09 > $tmp-ans && error_exit "error in test 3-1a"
diff $tmp-ans $tmp-nat2 || error_exit "error in test 3-2b"
echo test 3-1 OK

# test 3-2: 異常系 2つ目の入力が文字列
./kadai3.sh 6 abc > $tmp-ans && error_exit "error in test 3-2a"
diff $tmp-ans $tmp-nat2 || error_exit "error in test 3-2b"
echo test 3-2 OK

# test 4-1: 異常系 両方の入力が自然数ではない（1つ目で弾くので結果は2-1に同じ）
./kadai3.sh 0.09 -6 > $tmp-ans && error_exit "error in test 4-1a"
diff $tmp-ans $tmp-nat1 || error_exit "error in test 4-2b"
echo test 4-1 OK

# test 4-2: 異常系 両方の入力が文字列（1つ目で弾くので結果は2-2に同じ）
./kadai3.sh abc de > $tmp-ans && error_exit "error in test 4-2a"
diff $tmp-ans $tmp-nat1 || error_exit "error in test 4-2b"
echo test 4-2 OK

# test 5: 正常系 いずれかの入力が0
./kadai3.sh 0 9 > $tmp-ans || error_exit "error in test 5a"
diff $tmp-ans $tmp-zero || error_exit "error in test 5b"
echo test 5 OK

# test 6: 正常系 2つの自然数($1<$2)
./kadai3.sh 6 9 > $tmp-ans || error_exit "error in test 6a"
diff $tmp-ans $tmp-ok1 || error_exit "error in test 6b"
echo test 6 OK

# test 7: 正常系 2つの自然数($1>$2)
./kadai3.sh 9 18 > $tmp-ans || error_exit "error in test 7a"
diff $tmp-ans $tmp-ok2 || error_exit "error in test 7b"
echo test 7 OK

# test 8: 正常系 2つの自然数($1=$2)
./kadai3.sh 9 9 > $tmp-ans || error_exit "error in test 8a"
diff $tmp-ans $tmp-ok3 || error_exit "error in test 8b"
echo test 8 OK


