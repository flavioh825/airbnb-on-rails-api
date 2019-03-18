class Api::V1::PropertiesController < ApplicationController
  def index
    @properties = load_properties
    render json: @properties, include: :images
  end

  def create
    @property = Property.new(property_params)
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

  def load_properties
    Property.near_by(params[:latitude], params[:longitude], 10)
  end

  def property_params
    params.require(:property).permit(:user_id, :title, :address, 
                                     :price, :latitude, :longitude,
                                     image_attributes: [
                                      :property_id, :file
                                     ])
  end
end
