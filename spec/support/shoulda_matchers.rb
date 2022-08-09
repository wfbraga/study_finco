# frozen_string_literal: true

Shoulda::Matchers.configure do |config|
  config.integrate do | whith |
    whith.test_framework :rspec
    whith.library :rails
  end
end
