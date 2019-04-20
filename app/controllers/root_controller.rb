# frozen_string_literal: true

class RootController < ApplicationController
  def index
    gon.test = 'test'
  end

  def show; end
end
