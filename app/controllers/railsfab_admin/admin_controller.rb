require_dependency "railsfab_admin/application_controller"

module RailsfabAdmin
  class AdminController < ApplicationController
    def index
        @tables = ActiveRecord::Base.connection.tables
    end

    def new
        @model = params[:table].classify.constantize
        @new_model = @model.new
    end

    def create

    end

    def show_record
        @model = params[:table].classify.constantize
        @record = @model.find params[:id]
    end

    def show
        @model = params[:table].classify.constantize
        @tables = @model.all
    end

  end
end
