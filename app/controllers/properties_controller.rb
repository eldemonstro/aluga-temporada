class PropertiesController < ApplicationController
  def new
    @property = Property.new
    @locations = Location.all
    @property_types = PropertyType.all
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to property_path @property
    else
      @locations = Location.all
      @property_types = PropertyType.all
      render :new
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  private

  def property_params
    params.require(:property).permit(:title, :location_id, :area,
                                    :property_type_id, :rooms,
                                    :maximum_occupancy, :maximum_rent_days,
                                    :minimum_rent_days, :daily_rate,
                                    :description, :usage_rules)
  end
end
