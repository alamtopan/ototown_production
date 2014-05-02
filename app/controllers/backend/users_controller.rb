class Backend::UsersController < Backend::ApplicationController
  defaults :resource_class => User, :collection_name => 'users', :instance_name => 'user'
  prepend_before_filter :draw_password, only: :update
  before_filter :sex

  def create
    user = User.new users_params
    user.confirmation_token = nil
    user.confirmed_at = Time.now
    if user.save
      flash[:notice] = 'User Has Been Created'
    else
      flash[:error] = user.errors.full_messages
    end
    redirect_to backend_users_path
  end

  def add_dealer
    @user = User.find(params[:id])
    usr = @user.dealer_info
    usr.active = false
    if usr.save
      flash[:notice] = 'User Has Been Change To Dealer'
    else
      flash[:error] = 'Failed To Add Dealer'
    end
    redirect_to dealers_request_backend_dealers_path 
  end

  private    

    def users_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, profile_attributes: [:full_name, :avatar,:birthday,
        :province, :city, :address, :codepos, :gender, :phone] )
    end

    def draw_password
      %w(password password_confirmation).each do |attr|
        params[:user].delete(attr)
      end if params[:user] && params[:user][:password].blank?
    end

    def sex
      sex = ['Laki-Laki', 'Perempuan']
      @sex = sex.map{|sex| [sex, sex]}
    end

end