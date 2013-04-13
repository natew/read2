# The first thing you need to configure is which modules you need in your app.
# The default is nothing which will include only core features (password encryption, login/logout).
# Available submodules are: :user_activation, :http_basic_auth, :remember_me,
# :reset_password, :session_timeout, :brute_force_protection, :activity_logging, :external
Rails.application.config.sorcery.submodules = [:user_activation, :reset_password, :remember_me, :activity_logging, :external, :activation, :brute_force_protection]

# Here you can configure each submodule's features.
Rails.application.config.sorcery.configure do |config|

  

  config.external_providers = [:google]

  # config.twitter.key = "eYVNBjBDi33aa9GkA3w"
  # config.twitter.secret = "XpbeSdCoaKSmQGSeokz5qcUATClRW5u08QWNfv71N8"
  # config.twitter.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=twitter"
  # config.twitter.user_info_mapping = {:email => "screen_name"}
  
  # config.facebook.key = "34cebc81c08a521bc66e212f947d73ec"
  # config.facebook.secret = "5b458d179f61d4f036ee66a497ffbcd0"
  # config.facebook.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=facebook"
  # config.facebook.user_info_mapping = {:email => "name"}


  config.user_config do |user|
    user.username_attribute_names                      = [:email]
    user.subclasses_inherit_config                    = true

    user.user_activation_mailer                       = UserMailer
    user.activation_token_attribute_name              = :activation_token
    user.activation_token_expires_at_attribute_name   = :activation_token_expires_at

    user.reset_password_mailer                        = UserMailer
    user.reset_password_expiration_period             = 10.minutes
    user.reset_password_time_between_emails           = 5.minutes

    user.activity_timeout                             = 1.minutes

    user.consecutive_login_retries_amount_limit       = 8
    user.login_lock_time_period                       = 4.minutes

    user.authentications_class                        = Authentication
  end

  # This line must come after the 'user config' block.
  # Define which model authenticates with sorcery.
  config.user_class = "User"
end
