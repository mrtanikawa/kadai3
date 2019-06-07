#!/bin/sh

tmp=/tmp/$$

# エラーメッセージ出力
error_exit (){
	echo "$1" >&2
	rm -f $tmp-*
exit 1
}

# test 1: 異常系 引数の数が2以外
# $1="", $2=""
./kadai3.sh> $tmp-ans && error_exit "error in test 1-1"
echo "入力が2つではありません。もう一度実行してください。" > $tmp-args
diff $tmp-ans $tmp-args || error_exit "error in test 1-2"
echo test 1 OK

# test 2: 異常系 入力に負の数が含まれる
# $1=-6, $2=9
./kadai3.sh -6 9 > $tmp-ans && error_exit "error in test 2-1"
echo "1つ目の入力が自然数ではありません。もう一度実行してください。" > $tmp-nat1
diff $tmp-ans $tmp-nat1 || error_exit "error in test 2-2"
echo test 2 OK

# test 3: 異常系 入力に少数が含まれる
# $1=6, $2=0.9
./kadai3.sh 6 0.9 > $tmp-ans && error_exit "error in test 3-1"
echo "1つ目の自然数は6です。
2つ目の入力が自然数ではありません。もう一度実行してください。" > $tmp-nat2
diff $tmp-ans $tmp-nat2 || error_exit "error in test 3-2"
echo test 3 OK

# test 4: 異常系 入力に文字列が含まれる
# $1=a, $2=b
./kadai3.sh a b > $tmp-ans && error_exit "error in test 4-1"
echo "1つ目の入力が自然数ではありません。もう一度実行してください。" > $tmp-nat1
diff $tmp-ans $tmp-nat1 || error_exit "error in test 4-2"
echo test 4 OK

# test 5: 正常系 いずれかの入力が0
# $1=0, $2=6
./kadai3.sh 0 6 > $tmp-ans || error_exit "error in test 5-1"
echo "1つ目の自然数は0です。
2つ目の自然数は6です。
2つの自然数のうちいずれかあるいは両方が0の場合、最大公約数は0です。" > $tmp-zero
diff $tmp-ans $tmp-zero || error_exit "error in test 5-2"
echo test 5 OK

# test 6: 正常系 2つの自然数($1<$2)
# $1=6, $2=9
./kadai3.sh 6 9 > $tmp-ans || error_exit "error in test 6-1"
echo "1つ目の自然数は6です。
2つ目の自然数は9です。
6と9の最大公約数は3です。" > $tmp-ok1
diff $tmp-ans $tmp-ok1 || error_exit "error in test 6-2"
echo test 6 OK

# test 7: 正常系 2つの自然数($1>$2)
# $1=9, $2=18
./kadai3.sh 9 18 > $tmp-ans || error_exit "error in test 7-1"
echo "1つ目の自然数は9です。
2つ目の自然数は18です。
9と18の最大公約数は9です。" > $tmp-ok2
diff $tmp-ans $tmp-ok2 || error_exit "error in test 7-2"
echo test 7 OK
