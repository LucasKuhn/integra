class CategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @categories = Category.all
    render status: 200, json: @categories.to_json
  end

  def list
    @categories = Category.all.map {|category| {name: category.name, id:category.id} }
    render status: 200, json: @categories
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    render status: 200, json: @category.to_json
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    render status: 200, json: @category.to_json
  end

  def show
    @category = Category.find(params[:id])
    render status: 200, json: @category.to_json
  end

  private

  def category_params
    params.permit(:name,:image_url)
  end
end
