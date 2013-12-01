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
        @model = params[:table].classify.constantize
        @new_model = @model.new new_record_params(@model)
        if @new_model.valid?
            @new_model.save
            flash[:notice] = "A new record with id: #{@new_model.id} for the model #{@model} is created successfully/"
            redirect_to show_record_path(@model, @new_model)
        else
            render :new
        end

    end

    def show_record
        @model = params[:table].classify.constantize
        @record = @model.find params[:id]
    end

    def show
        @model = params[:table].classify.constantize
        @tables = @model.all
    end

    private

    def new_record_params(model)
        columns = model.column_names.map { |column| column.to_sym }
        columns.delete(:id)
        params.require(model.to_s.downcase.to_sym).permit(columns)
    end


  end
end
