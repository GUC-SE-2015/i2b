class ConsultanciesController < ApplicationController
  before_action :set_consultancy, only: [:show, :edit, :update, :destroy]

  # GET /consultancies
  # GET /consultancies.json
  def index
    @consultancies = Consultancy.all
  end

  # GET /consultancies/1
  # GET /consultancies/1.json
  def show
    @consultancy = Consultancy.find(params[:id])
  end

  # GET /consultancies/new
  def new
    @consultancy = Consultancy.new
    @consultancy.pitch_id = cookies[:pitch_id]
    @consultancy.consaltant_id = cookies[:consultant_id]    
  end

  # GET /consultancies/1/edit
  def edit
  end

  # POST /consultancies
  # POST /consultancies.json
  def create
    @consultancy = Consultancy.new(consultancy_params)
    respond_to do |format|
      @consultancy.pitch_id = cookies[:pitch_id]
      @consultancy.consaltant_id = cookies[:consultant_id]
      if @consultancy.save
        format.html { redirect_to :controller => 'pitches' ,:action => 'show', :id => @consultancy.pitch_id , notice: 'Consultancy was successfully created.' }
        format.json { render :show, status: :created, location: @consultancy }
      else
        format.html { render :new }
        format.json { render json: @consultancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consultancies/1
  # PATCH/PUT /consultancies/1.json
  def update
    respond_to do |format|
      if @consultancy.update(consultancy_params)
        format.html { redirect_to @consultancy, notice: 'Consultancy was successfully updated.' }
        format.json { render :show, status: :ok, location: @consultancy }
      else
        format.html { render :edit }
        format.json { render json: @consultancy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consultancies/1
  # DELETE /consultancies/1.json
  def destroy
    @consultancy.destroy
    respond_to do |format|
      format.html { redirect_to consultancies_url, notice: 'Consultancy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approve
    @consultancy = Consultancy.find(params[:id])
    @consultancy.approved = true
    @consultancy.save
    redirect_to :controller => 'pitches', :action => 'show', :id => @consultancy.pitch_id
  end

  def deny
    @consultancy = Consultancy.find(params[:id])
    @consultancy.approved = false
    @consultancy.save
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultancy
      @consultancy = Consultancy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consultancy_params
      params.require(:consultancy).permit(:pitch_id, :body, :consaltant_id, :approved)
    end
end
