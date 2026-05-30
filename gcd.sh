#!/bin/bash
if [ $# -ne 2 ]; then
  echo "Error: 引数を2つ入力してください。" >&2
  exit 1
fi
if ! [[ "$1" =~ ^[1-9][0-9]*$ ]] || ! [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
  echo "Error: 引数は自然数を入力してください。" >&2
  exit 1
fi
a=$1
b=$2
while [ "$b" -ne 0 ]; do
  temp=$b
  b=$((a % b))
  a=$temp
done
echo "$a"
exit 0
