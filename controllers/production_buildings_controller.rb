require 'require_all'
require_all '.'

module Controllers
  class ProductionBuildingsController < ApplicationController
    def index
      @view ||= view.new
      @pb = Models::ProductionBuidling.new
    end

    def update
      # @options
    end
  end
end
