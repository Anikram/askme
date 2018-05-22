InvisibleCaptcha.setup do |config|
  # config.honeypots           << ['more', 'fake', 'attribute', 'names']
   config.visual_honeypots    = true
   config.timestamp_threshold = 0
  # config.timestamp_enabled   = true
  # config.injectable_styles   = false

  # Leave these unset if you want to use I18n (see below)
   config.sentence_for_humans     = 'Проигнорируйте это поле!  '
  # config.timestamp_error_message = 'Sorry, that was too quick! Please resubmit.'
end