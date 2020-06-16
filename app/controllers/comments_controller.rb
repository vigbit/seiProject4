class CommentsController < ApplicationController
  before_action :get_campaign
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = @campaign.comments
    @users = User.all
    @user = current_user
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @users = User.all
    @user = current_user
  end

  # GET /comments/new
  def new
    @comment = @campaign.comments.build
    @users = User.all
    @user = current_user
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @campaign.comments.build(comment_params)
    @comment.user = current_user
    puts "##################################################"
    respond_to do |format|
      if @comment.save
        format.html { redirect_to campaign_comments_path(@campaign), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to campaign_comment_path(@campaign), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to campaign_comments_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_campaign
      @campaign = Campaign.find(params[:campaign_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @campaign.comments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :campaign_id, :user_id)
    end
end
