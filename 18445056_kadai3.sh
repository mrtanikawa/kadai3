#!/bin/sh
  
# 自然数チェック
echo "1つ目の自然数を入力してください。"
read a

if expr "$a" : '[0-9]\+$' >/dev/null
then
        echo "1つ目の自然数は$aです。"
else
        echo "$aは自然数ではありません。プログラムを再実行してください。"
        exit
fi

echo "2つ目の自然数を入力してください。"
read b

if expr "$b" : '[0-9]\+$' >/dev/null
then
        echo "2つ目の自然数は$bです。"
else
        echo "$bは自然数ではありません。プログラムを再実行してください。"
        exit
fi


# 0の場合
if [ $a -eq 0 -o $b -eq 0 ]
then
        echo "2つの自然数のうちいずれかあるいは両方が0の場合、最大公約数は0です。"
        exit
fi


# 最大公約数計算
m=$a

if [ $b -lt $m ]
then
        m=$b
fi

while [ $m -ne 0 ] 
do
        x=`expr $a % $m`
        y=`expr $b % $m`
        if [ $x -eq 0 -a $y -eq 0 ]
        then echo "$aと$bの最大公約数は$mです。"
                break
        fi
        m=`expr $m - 1`


done
