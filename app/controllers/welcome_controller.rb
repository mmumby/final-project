class WelcomeController < ApplicationController
  before_action :disable_nav, only: [:index]
end
