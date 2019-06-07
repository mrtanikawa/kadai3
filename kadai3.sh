#!/bin/sh

# 引数の数をチェック
if [ $# -ne 2 ] 
then
	echo "入力が2つではありません。もう一度実行してください。"
	exit 1
fi

# 1つ目の入力チェック
if expr "$1" : '[0-9]\+$' >/dev/null
then
	echo "1つ目の自然数は$1です。"
else
	echo "1つ目あるいは両方の入力が自然数ではありません。もう一度実行してください。"
	exit 1
fi

# 2つ目の入力チェック
if  expr "$2" : '[0-9]\+$' >/dev/null
then
	echo "2つ目の自然数は$2です。"
else
        echo "2つ目の入力が自然数ではありません。もう一度実行してください。"
        exit 1
fi

# いずれかあるいは両方の入力が0の場合
if [ $1 -eq 0 -o $2 -eq 0 ]
then
        echo "2つの自然数のうちいずれかあるいは両方が0の場合、最大公約数は0です。"
        exit 0
fi

# 2つの自然数の最大公約数を計算
m=$1

if [ $2 -lt $m ]
then
        m=$2
fi

while [ $m -ne 0 ] 
do
        x=`expr $1 % $m`
        y=`expr $2 % $m`
        if [ $x -eq 0 -a $y -eq 0 ]
        then echo "$1と$2の最大公約数は$mです。"
                break
        fi
        m=`expr $m - 1`
done
