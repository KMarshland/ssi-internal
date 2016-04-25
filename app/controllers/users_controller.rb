class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :requires_super_admin, except: [:no_permissions, :current]

  def current
    result = {
        logged_in: is_logged_in?
    }
    result[:user] = JSON(current_user.to_json) if is_logged_in?
    render json: result
  end

  def role
    @user = User.find(params[:id])
    @role = Role.where(name: params[:name]).first
    if params[:val] == 'true'
      @user.roles += [@role]
    else
      @user.roles -= [@role]
    end
    @user.roles.uniq!
    @user.save!

    render json: {success: true}
  end

  def no_permissions
    respond_to do |format|
      format.html { render }
      format.json {
        render json: {
                   success: false,
                   errors: ["Sorry, but you don't have permission to do that"]
               }
      }
    end
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.find_each
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :provider, :oauth_token, :oauth_expires_at)
    end
end