# 目的

以下2点の検証

- Docker環境でのchrome_headlessを使用したsystem specの実行

- CodeBuildでRSpec実行結果のレポート表示
  - cf. https://tech.andpad.co.jp/entry/2020/09/15/113057

# Hands-on

- ①Dockerfileでイメージを作成
  - 最低限のRailsと、system specを1つ用意しています。
  - system_specでchrome_headlessを使う場合`--no-sandbox`オプションでchrome_headlessを起動しないと、Docker環境ではエラーになる模様。そのため明示的に`--no-sandbox`を指定したdriverをcapybaraに登録する。
    - https://blog.toshimaru.net/rails-on-docker-system-spec/
- ②ECRにイメージをpush
  - 別途AWS CLIのインストールが必要だが詳細は[こちら](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/getting-started-install.html)の公式の手順を参照にすること。あとは、AWSコンソールのECRの画面から「プッシュコマンドの表示」があるので、その通りにコマンドを打てばよいです。
  - ECRへのプッシュについてはこちらの[動画](https://www.youtube.com/watch?v=2_FxLp9xgmo)が参考になります。


- ③CodePipelineを作成
  - CodeBuildからECRのイメージを取得するためには、[こちらの公式の解説](https://docs.aws.amazon.com/ja_jp/codebuild/latest/userguide/sample-ecr.html
)のとおりECRにアクセス許可を割り当てる必要があります。

- ④パイプラインを実行

