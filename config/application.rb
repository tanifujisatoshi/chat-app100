require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatApp100
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
# 日本時刻の設定にはapplicationファイルを活用する
# 投稿されたメッセージの投稿時間を日本時間に設定している
    config.load_defaults 6.0
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    
    config.generators do |g|
      g.stylesheets    false
      g.javascripts    false
      g.helper         false
      g.test_framework false
    end
# rails g コマンドでコントローラーを作成すると以下のファイルが自動で生成される
# ・生成したコントローラーに対応したstylesheetファイル
# ・生成したコントローラーに対応したヘルパー
# ・生成したコントローラーに対応したjavascriptファイル
# ・アプリケーションをテストするためのファイル
# chat-app100では必要ないファイルなので生成されないようにしました
  end
end
