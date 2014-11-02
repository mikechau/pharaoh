class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :enable]
  before_action :remove_blank_password, only: :update

  add_breadcrumb 'Admin', :admin_root_path
  add_breadcrumb 'User Management', :admin_users_path

  def index
    @users = policy_scope(
      User.
        order_by_id.
        page(params[:page])
    )
    authorize @users

    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    add_breadcrumb 'Profile', admin_user_path
  end

  def new
    add_breadcrumb 'New User', new_admin_user_path
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
    @user.skip_confirmation!
    authorize @user

    if @user.save
      redirect_to admin_users_path, notice: "Created User #{@user.id}: #{@user.name}."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "Updated User #{@user.id}: #{@user.name}."
    else
      render 'edit'
    end
  end

  def destroy
    respond_to do |format|
      if @user != current_user && @user.destroy

        format.html { redirect_to admin_users_path,
          notice: "#{@user.destroy_method_name}d User #{@user.id}: #{@user.name}." }
        format.js
      else
        format.html { redirect_to admin_users_path,
          notice: "Can't delete yourself." }
        format.js { render 'failure' }
      end
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
      authorize @user
    end

    def user_params
      params.require(:user).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
        :registration_status,
        role_ids: []
      )
    end

    def remove_blank_password
      if params[:user][:password].blank?
        params[:user].delete('password')
        params[:user].delete('password_confirmation')
      end
    end
end