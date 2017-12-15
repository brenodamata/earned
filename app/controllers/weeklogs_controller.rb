class WeeklogsController < ApplicationController
  before_action :set_weeklog, only: [:show, :edit, :update, :destroy]

  # GET /weeklogs
  # GET /weeklogs.json
  def index
    @weeklogs = Weeklog.all
  end

  # GET /weeklogs/1
  # GET /weeklogs/1.json
  def show
  end

  # GET /weeklogs/new
  def new
    @weeklog = Weeklog.new
  end

  # GET /weeklogs/1/edit
  def edit
  end

  # POST /weeklogs
  # POST /weeklogs.json
  def create
    @weeklog = Weeklog.new(weeklog_params)

    respond_to do |format|
      if @weeklog.save
        format.html { redirect_to @weeklog, notice: 'Weeklog was successfully created.' }
        format.json { render :show, status: :created, location: @weeklog }
      else
        format.html { render :new }
        format.json { render json: @weeklog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weeklogs/1
  # PATCH/PUT /weeklogs/1.json
  def update
    respond_to do |format|
      if @weeklog.update(weeklog_params)
        format.html { redirect_to @weeklog, notice: 'Weeklog was successfully updated.' }
        format.json { render :show, status: :ok, location: @weeklog }
      else
        format.html { render :edit }
        format.json { render json: @weeklog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weeklogs/1
  # DELETE /weeklogs/1.json
  def destroy
    @weeklog.destroy
    respond_to do |format|
      format.html { redirect_to weeklogs_url, notice: 'Weeklog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weeklog
      @weeklog = Weeklog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weeklog_params
      params.require(:weeklog).permit(:start_date_code, :end_date_code, :weekly_incentive, :incentive_total, :wins, :losses)
    end
end
