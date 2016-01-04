require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Myapp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.assets.precompile += [ 'appviews.css', 'cssanimations.css', 'dashboards.css', 'forms.css', 'gallery.css', 'graphs.css', 'mailbox.css', 'miscellaneous.css', 'pages.css', 'tables.css', 'uielements.css', 'widgets.css' ]
    config.assets.precompile += [ 'appviews.js', 'cssanimations.js', 'dashboards.js', 'forms.js', 'gallery.js', 'graphs.js', 'mailbox.js', 'miscellaneous.js', 'pages.js', 'tables.js', 'uielements.js', 'widgets.js', 'iCheck/icheck.min', 'staps/jquery.steps.min', 'validate/jquery.validate.min',
                                  'dropzone/dropzone', 'summernote/summernote.min',
                                  'colorpicker/bootstrap-colorpicker.min', 'cropper/cropper.min',
                                  'datapicker/bootstrap-datepicker', 'ionRangeSlider/ion.rangeSlider.min',
                                  'jasny/jasny-bootstrap.min', 'jsKnob/jquery.knob',
                                  'nouslider/jquery.nouislider.min', 'switchery/switchery', 'chosen/chosen.jquery',
                                  'fullcalendar/moment.min', 'clockpicker/clockpicker',
                                  'daterangepicker/daterangepicker', 'select2/select2.full.min', "markerclusterer_packed", "signup"]

  end
end
