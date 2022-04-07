FROM ruby:3.0.1

RUN apt update && \
    apt install -y build-essential \
                   vim \
                   sudo
# node
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && \
    apt install -y nodejs
# yarn
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null && \
    echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    sudo apt update && sudo apt install yarn

# 作業ディレクトリの作成、設定
RUN mkdir /app
WORKDIR /app

# COPY Gemfile /app/Gemfile
# COPY Gemfile.lock /app/Gemfile.lock
# RUN bundle install
# COPY . /app

# RUN yarn install --check-files
# RUN bundle exec rails assets:precompile

# # Add a script to be executed every time the container starts.
# COPY docker-entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/docker-entrypoint.sh
# ENTRYPOINT ["docker-entrypoint.sh"]
# EXPOSE 3000

# # Start the main process.
# CMD ["rails", "s", "-b", "0.0.0.0"]
