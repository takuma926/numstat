# numstat

[![test](https://github.com/takuma926/numstat/actions/workflows/test.yml/badge.svg)](https://github.com/takuma926/numstat/actions/workflows/test.yml)

標準入力から数値データを受け取り、ストリーム統計量（件数、合計、平均、最小値、最大値）を計算して出力するLinuxコマンドです。オプション引数を指定することで、シェルスクリプトやパイプライン処理に適した単一の統計値のみを出力することも可能です。

## インストールと実行方法

リポジトリをクローンして実行権限を付与することで、すぐに利用できます。

```
$ git clone [https://github.com/takuma926/numstat.git](https://github.com/takuma926/numstat.git)
$cd numstat$ chmod +x numstat
```

#使用方法
基本的な使い方
標準入力から改行区切りで数字を渡します。

```
$ seq 5 | ./numstat
count: 5
sum: 15
mean: 3
min: 1
max: 5
```


#オプション指定による値の出力
他のコマンドへ結果を渡す場合などに、特定の統計量のみを数値として出力できます。

合計値のみ出力 (-s または --sum)

```
$ seq 5 | ./numstat -s
15
```


平均値のみ出力 (-m または --mean)
```
$ seq 5 | ./numstat -m
3
```

最大値のみ出力 (--max)
```
$ seq 5 | ./numstat --max
5
```

最小値のみ出力 (--min)
```
$ seq 5 | ./numstat --min
1
```

データ件数のみ出力 (-c または --count)
```
$ seq 5 | ./numstat -c
5
```

#オプション一覧

オプション,説明
"-s, --sum",合計値のみを出力
"-m, --mean",平均値のみを出力
"-c, --count",データ件数のみを出力
--min,最小値のみを出力
--max,最大値のみを出力


#動作要件

OS: Ubuntu 22.04 LTS / 24.04 LTS

Python: 3.10 / 3.11 / 3.12 / 3.13 / 3.14

#テストについて

リポジトリ内の test.bash を用いて、正常系入力、異常系入力（文字入力や空入力時の標準エラー出力と終了ステータス）、各オプションの動作検証を行っています。GitHub Actions により、対応する全 Python バージョンでの自動テストを実施しています。

#ライセンス

このソフトウェアは、BSD 3-Clause License の下で公開されています。

SPDX-FileCopyrightText: 2026 鈴木 逞馬

SPDX-License-Identifier: BSD-3-Clause


