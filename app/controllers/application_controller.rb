class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

    def hyphenate(string)
      string.gsub(' ', '-')
    end

    def spacify(string)
      string.gsub('-', ' ')
    end

  helper_method :hyphenate, :spacify
end
