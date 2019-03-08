class Api::V1::PropertiesController < ApplicationController
  def index
    @properties = Property.all
    render json: @properties
  end

  def create
    @property = Person.new(property_params)
    if @property.save
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def show
    @property = load_property
    render json: @property
  end

  def update
    @property = load_property
    if @property.update(property_params)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def delete
    @property = load_property
    @property.destroy
  end

  private

  def load_property
    Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:user_id, :title, :address, :price, :latitude, :longitude)
  end
end
