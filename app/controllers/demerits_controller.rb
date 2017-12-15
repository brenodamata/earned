class DemeritsController < ApplicationController
  before_action :set_demerit, only: [:show, :edit, :update, :destroy]

  # GET /demerits
  # GET /demerits.json
  def index
    @demerits = Demerit.all
  end

  # GET /demerits/1
  # GET /demerits/1.json
  def show
  end

  # GET /demerits/new
  def new
    @demerit = Demerit.new
  end

  # GET /demerits/1/edit
  def edit
  end

  # POST /demerits
  # POST /demerits.json
  def create
    @demerit = Demerit.new(demerit_params)

    respond_to do |format|
      if @demerit.save
        format.html { redirect_to @demerit, notice: 'Demerit was successfully created.' }
        format.json { render :show, status: :created, location: @demerit }
      else
        format.html { render :new }
        format.json { render json: @demerit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demerits/1
  # PATCH/PUT /demerits/1.json
  def update
    respond_to do |format|
      if @demerit.update(demerit_params)
        format.html { redirect_to @demerit, notice: 'Demerit was successfully updated.' }
        format.json { render :show, status: :ok, location: @demerit }
      else
        format.html { render :edit }
        format.json { render json: @demerit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demerits/1
  # DELETE /demerits/1.json
  def destroy
    @demerit.destroy
    respond_to do |format|
      format.html { redirect_to demerits_url, notice: 'Demerit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demerit
      @demerit = Demerit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def demerit_params
      params.require(:demerit).permit(:name)
    end
end
