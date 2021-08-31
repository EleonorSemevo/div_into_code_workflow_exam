class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  # GET /properties or /properties.json
  def index
    @properties = Property.all
  end

  # GET /properties/1 or /properties/1.json
  def show
    @stations = @property.stations
  end

  # GET /properties/new
  def new
    @property = Property.new
    @station1 = Station.new
    @station2 = Station.new
  end

  # GET /properties/1/edit
  def edit
    @station = Station.new
  end

  # POST /properties or /properties.json
  def create
    @station1 = Station.new(name: params[:property][:name1],
                            walk: params[:property][:walk1],
                            railway: params[:property][:railway1])

    @station2 = Station.new(name: params[:property][:name2],
                            walk: params[:property][:walk2],
                            railway: params[:property][:railway2])

    pp = {
      properties:{
        name: params[:property][:name],
        rent: params[:property][:rent],
        age: params[:property][:age],
        address: params[:property][:address],
        remark: params[:property][:remark],
        stations_attributes: [
        @station1,
        @station2
        ]
      }
    }


    @property = Property.new(pp[:properties])
    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: "Property was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update

    # @station1 = Station.new(name: params[:property][:name1],
    #                         walk: params[:property][:walk1],
    #                         railway: params[:property][:railway1])
    #
    # @station2 = Station.new(name: params[:property][:name2],
    #                         walk: params[:property][:walk2],
    #                         railway: params[:property][:railway2])
    # @station3 = Station.new(name: params[:property][:name3],
    #                         walk: params[:property][:walk3],
    #                         railway: params[:property][:railway3])
    # pp = {
    #   properties:{
    #     name: params[:property][:name],
    #     rent: params[:property][:rent],
    #     age: params[:property][:age],
    #     address: params[:property][:address],
    #     remark: params[:property][:remark],
    #     stations_attributes: [
    #       @station1,
    #       @station2,
    #       @station3
    #     ]
    #   }
    # }
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: "Property was successfully updated." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy

    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "Property was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :rent, :age, :address, :remark,
                                       :name1,:name2, :railway1,
                                       :railway2,:walk1,:walk2)
    end
end
