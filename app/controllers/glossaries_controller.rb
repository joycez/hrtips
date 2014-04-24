# coding: utf-8

class GlossariesController < ApplicationController
  before_action :set_glossary, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  # GET /glossaries
  # GET /glossaries.json
  def index
    @glossaries = Glossary.english.all
  end

  # GET /glossaries/1
  # GET /glossaries/1.json
  def show
  end

  # GET /glossaries/new
  def new
    @glossary = current_admin.glossaries.new
  end

  # GET /glossaries/1/edit
  def edit
  end

  # POST /glossaries
  # POST /glossaries.json
  def create
    @glossary = current_admin.glossaries.new(glossary_params)

    respond_to do |format|
      if @glossary.save
        format.html { redirect_to @glossary, notice: 'Glossary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @glossary }
      else
        format.html { render action: 'new' }
        format.json { render json: @glossary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /glossaries/1
  # PATCH/PUT /glossaries/1.json
  def update
    respond_to do |format|
      if @glossary.update(glossary_params)
        @glossary.saved_by(current_admin)
        format.html { redirect_to @glossary, notice: 'Glossary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @glossary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glossaries/1
  # DELETE /glossaries/1.json
  def destroy
    @glossary.destroy
    respond_to do |format|
      format.html { redirect_to glossaries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glossary
      @glossary = Glossary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def glossary_params
      #params[:glossary]
      params.require(:glossary).permit(:term, :language, :definition)
    end
end
