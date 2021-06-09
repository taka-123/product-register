# ubuntuでも良いが、後からrubyを入れるのは大変なのでrubyを使用。
# バージョンは、今回RAILSの5.2を使用予定なので、それに合うものを選択。
FROM ruby:2.5
# 本来は、必要なパッケージはコンテナを立てて調べながら書いていく。
RUN apt-get update && apt-get install -y \
		build-essential \
		libpq-dev \
		nodejs \
		postgresql-client \
		yarn
# コンテナ側にも、product-registerディレクトリを作成し、そこへ移動。
WORKDIR /product-register
# ホスト側のGemfileとGemfile.lockを、product-register 直下にコピーする。
# （Gemfile.lockは、Gemfileを使って、bundel installした時に、実際にインストールされたGemのバージョンと情報が格納されるファイル）
COPY Gemfile Gemfile.lock /product-register/
RUN bundle install