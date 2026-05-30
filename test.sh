#!/bin/bash
if [ ! -f ./gcd.sh ]; then
  echo "Error: gcd.sh が見つかりません。"
  exit 1
fi
ERROR_COUNT=0
echo "=== テスト開始 ==="
result=$(./gcd.sh 2 4)
if [ "$result" = "2" ]; then
  echo "OK: 2と4を入力 -> 出力 $result"
else
  echo "NG: 2と4を入力したのに $result が出力されました"
  ERROR_COUNT=$((ERROR_COUNT + 1))
fi
./gcd.sh 3 > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "OK: 引数1つ(3) -> エラーを返しました"
else
  echo "NG: 引数1つ(3)なのに正常終了しました"
  ERROR_COUNT=$((ERROR_COUNT + 1))
fi
./gcd.sh a b > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "OK: 文字を入力 -> エラーを返しました"
else
  echo "NG: 文字を入力したのに正常終了しました"
  ERROR_COUNT=$((ERROR_COUNT + 1))
fi
echo "=== テスト終了 ==="
if [ $ERROR_COUNT -eq 0 ]; then
  echo "すべてのテストに合格しました！"
  exit 0
else
  echo "${ERROR_COUNT} 個のテストで失敗しました。"
  exit 1
fi
