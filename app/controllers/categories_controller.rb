class CategoriesController < ApplicationController

  before_action :set_category

  def sub_categories
    sub_categories = @category.sub_categories
    respond_to do |format|
      if request.xhr?
        format.json { render json: sub_categories.to_json }
      else
        format.html
      end
    end
  end

  def pilots
    pilots = @category.pilots
    respond_to do |format|
      if request.xhr?
        format.json { render json: pilots.to_json }
      else
        format.html
      end
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
