class GoalTriggersController < ApplicationController
  before_action :set_goal_trigger, only: [:show, :edit, :update, :destroy]

  # GET /goal_triggers
  # GET /goal_triggers.json
  def index
    @goal_triggers = GoalTrigger.all
  end

  # GET /goal_triggers/1
  # GET /goal_triggers/1.json
  def show
  end

  # GET /goal_triggers/new
  def new
    @goal_trigger = GoalTrigger.new
  end

  # GET /goal_triggers/1/edit
  def edit
  end

  # POST /goal_triggers
  # POST /goal_triggers.json
  def create
    @goal_trigger = GoalTrigger.new(goal_trigger_params)

    respond_to do |format|
      if @goal_trigger.save
        format.html { redirect_to @goal_trigger, notice: 'Goal trigger was successfully created.' }
        format.json { render :show, status: :created, location: @goal_trigger }
      else
        format.html { render :new }
        format.json { render json: @goal_trigger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goal_triggers/1
  # PATCH/PUT /goal_triggers/1.json
  def update
    respond_to do |format|
      if @goal_trigger.update(goal_trigger_params)
        format.html { redirect_to @goal_trigger, notice: 'Goal trigger was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal_trigger }
      else
        format.html { render :edit }
        format.json { render json: @goal_trigger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_triggers/1
  # DELETE /goal_triggers/1.json
  def destroy
    @goal_trigger.destroy
    respond_to do |format|
      format.html { redirect_to goal_triggers_url, notice: 'Goal trigger was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal_trigger
      @goal_trigger = GoalTrigger.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_trigger_params
      params.require(:goal_trigger).permit(:frequency, :metric_id, :trigger_level, :spoils, :fee, :message)
    end
end
