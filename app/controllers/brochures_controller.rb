class BrochuresController < ApplicationController
  before_action :set_brochure, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  # GET /brochures
  # GET /brochures.json
  def index
    @brochures = Brochure.english.order("group_id ASC").all
  end

  # GET /brochures/1
  # GET /brochures/1.json
  def show
    @brochure = Brochure.find(params[:id])
    tag_list = @brochure.tag_list
    if not tag_list.blank?
      @tags = tag_list.join(', ')
    end
  end

  # GET /brochures/new
  def new
    @brochure = Brochure.new
  end

  # GET /brochures/1/edit
  def edit
    @tag_list = @brochure.tag_list
    @all_tags_list = ActsAsTaggableOn::Tag.all
  end

  # POST /brochures
  # POST /brochures.json
  def create
    @brochure = current_admin.brochures.new(brochure_params)

    respond_to do |format|
      if @brochure.save
        format.html { redirect_to @brochure, notice: 'Brochure was successfully created.' }
        format.json { render action: 'show', status: :created, location: @brochure }
      else
        format.html { render action: 'new' }
        format.json { render json: @brochure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brochures/1
  # PATCH/PUT /brochures/1.json
  def update
    respond_to do |format|
      if @brochure.update(brochure_params)
        format.html { redirect_to @brochure, notice: 'Brochure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @brochure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brochures/1
  # DELETE /brochures/1.json
  def destroy
    @brochure.destroy
    respond_to do |format|
      format.html { redirect_to brochures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brochure
      @brochure = Brochure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brochure_params
      #params[:brochure]
      params.require(:brochure).permit(:topic, :name, :author_hist, :content, {tag_list: []})
    end
end
