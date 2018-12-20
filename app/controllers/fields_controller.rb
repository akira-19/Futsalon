class FieldsController < ApplicationController
  def index
    @fields = Field.all
  end

  def show
  end

  def search
    @fields = Field.where(prefecture: params[:prefecture])
    render :index
  end
end
