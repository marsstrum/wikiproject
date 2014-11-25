class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  # GET /wikis
  # GET /wikis.json
  def index
   #@wikis = policy_scope(Wiki)
   @wikis = Wiki.visible_to(current_user)
   #@wikis = Wiki.all
    #authorize @wikis
  end

  # GET /wikis/1
  # GET /wikis/1.json
  def show
   authorize @wiki
  end

  # GET /wikis/new
  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  # GET /wikis/1/edit
  def edit
    authorize @wiki
  end

  # POST /wikis
  # POST /wikis.json
  def create
    @wiki = current_user.wikis.build(wiki_params)
    authorize @wiki
    respond_to do |format|
      if @wiki.save
        format.html { redirect_to @wiki, notice: 'Wiki was successfully created.' }
        format.json { render action: 'show', status: :created, location: @wiki }
      else
        format.html { render action: 'new' }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wikis/1
  # PATCH/PUT /wikis/1.json
  def update
    respond_to do |format|
      authorize @wiki
      if @wiki.update(wiki_params)
        format.html { redirect_to @wiki, notice: 'Wiki was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.json
  def destroy
    @wiki.destroy
    authorize @wiki
    respond_to do |format|
      format.html { redirect_to wikis_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_params
      params.require(:wiki).permit(:title, :body, :private)
    end
end
