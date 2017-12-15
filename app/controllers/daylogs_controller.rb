class DaylogsController < ApplicationController
  before_action :set_daylog, only: [:show, :edit, :update, :destroy]

  # GET /daylogs
  # GET /daylogs.json
  def index
    @daylogs = Daylog.all
  end

  # GET /daylogs/1
  # GET /daylogs/1.json
  def show
  end

  # GET /daylogs/new
  def new
    @daylog = Daylog.new
  end

  # GET /daylogs/1/edit
  def edit
  end

  # POST /daylogs
  # POST /daylogs.json
  def create
    @daylog = Daylog.new(daylog_params)

    respond_to do |format|
      if @daylog.save
        format.html { redirect_to @daylog, notice: 'Daylog was successfully created.' }
        format.json { render :show, status: :created, location: @daylog }
      else
        format.html { render :new }
        format.json { render json: @daylog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daylogs/1
  # PATCH/PUT /daylogs/1.json
  def update
    respond_to do |format|
      if @daylog.update(daylog_params)
        format.html { redirect_to @daylog, notice: 'Daylog was successfully updated.' }
        format.json { render :show, status: :ok, location: @daylog }
      else
        format.html { render :edit }
        format.json { render json: @daylog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daylogs/1
  # DELETE /daylogs/1.json
  def destroy
    @daylog.destroy
    respond_to do |format|
      format.html { redirect_to daylogs_url, notice: 'Daylog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daylog
      @daylog = Daylog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daylog_params
      params.require(:daylog).permit(:date_code, :incentive_total, :strikes, :win)
    end
end
