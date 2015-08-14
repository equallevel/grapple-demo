class ZipCodesController < ApplicationController
  before_action :set_zip_code, only: [:show, :edit, :update, :destroy]

  # GET /zip_codes
  def index
    @zip_codes = ZipCode.all
  end

  # GET /zip_codes/1
  def show
  end

  # GET /zip_codes/new
  def new
    @zip_code = ZipCode.new
  end

  # GET /zip_codes/1/edit
  def edit
  end

  # POST /zip_codes
  def create
    @zip_code = ZipCode.new(zip_code_params)

    if @zip_code.save
      redirect_to @zip_code, notice: 'Zip code was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /zip_codes/1
  def update
    if @zip_code.update(zip_code_params)
      redirect_to @zip_code, notice: 'Zip code was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /zip_codes/1
  def destroy
    @zip_code.destroy
    redirect_to zip_codes_url, notice: 'Zip code was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zip_code
      @zip_code = ZipCode.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def zip_code_params
      params.require(:zip_code).permit(:zip, :city, :county, :state_id, :latitude, :longitude)
    end
end
