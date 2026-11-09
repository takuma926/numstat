#!/bin/bash
# SPDX-FileCopyrightText: 2026 鈴木 逞馬
# SPDX-License-Identifier: BSD-3-Clause

ng () {
    echo ${1}行目が違うよ
    res=1
}

res=0
# 基本的な使い方のテスト
out=$(seq 5 | ./numstat)
[ "${out}" = "5 15 3 1 5" ] || ng "${LINENO}"
# 合計値のテスト
out=$(seq 5 | ./numstat -s)
[ "${out}" = 15 ] || ng "${LINENO}"

# 平均値のテスト
out=$(seq 5 | ./numstat -m)
[ "${out}" = 3 ] || ng "${LINENO}"

# 最大値のテスト
out=$(seq 5 | ./numstat --max)
[ "${out}" = 5 ] || ng "${LINENO}"

# 最小値のテスト
out=$(seq 5 | ./numstat --min)
[ "${out}" = 1 ] || ng "${LINENO}"

# 件数のテスト
out=$(seq 5 | ./numstat -c)
[ "${out}" = 5 ] || ng "${LINENO}"


# 文字列が入力された場合（終了ステータス1になり、エラーメッセージが出るか）
out=$(echo "あ" | ./numstat 2>&1)
[ "$?" = 1 ] || ng "${LINENO}"
[ "${out}" = "Error: Invalid input 'あ'" ] || ng "${LINENO}"

# 何も数値が入力されなかった場合
out=$(echo "" | ./numstat 2>&1)
[ "$?" = 1 ] || ng "${LINENO}"
[ "${out}" = "Error: No numeric input provided" ] || ng "${LINENO}"


# 全て成功したらOKを表示して終了
[ "$res" = 0 ] && echo OK
exit $res
