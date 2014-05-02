class Backend::DealersController < Backend::ApplicationController
  defaults :resource_class => Dealer, :collection_name => 'dealers', :instance_name => 'dealer'
  prepend_before_filter :draw_password, only: :update
  before_filter :category_type
  before_filter :sex

  def index
  	@dealers = Dealer.includes(:dealer_info).where("dealer_infos.active = TRUE").order("operators.id DESC")
  end

  def create
    dealer = Dealer.new dealers_params
    if dealer.save
      flash[:notice] = 'Dealer Has Been Created'
    else
      flash[:error] = dealer.errors.full_messages
    end
    redirect_to backend_dealers_path
  end

  def dealers_request
  	@dealers = Dealer.includes(:dealer_info).where("dealer_infos.active = FALSE").order("operators.id DESC")
  end

  def approve_dealer
  	@dealer = DealerInfo.find_by_dealer_id(params[:id])
  	if @dealer.update({active: true})
  		flash[:notice] = "Dealer Request Approved"
  	elsif
  		flash[:error] = "Failed To Approved"
  	end
  	redirect_to backend_dealers_path
  end

  def unapprove_dealer
  	@dealer = DealerInfo.find_by_dealer_id(params[:id])
  	if @dealer.update({active: false})
  		flash[:notice] = "Dealer Request Unapproved"
  	elsif
  		flash[:error] = "Failed To Unapproved"
  	end
  	redirect_to dealers_request_backend_dealers_path
  end

  private

    def dealers_params
      params.require(:dealer).permit(:username, :email, :password, :password_confirmation, profile_attributes: [:full_name, :avatar,:birthday,
        :province, :city, :address, :codepos, :gender, :phone], dealer_info_attributes: [:title,:address,:phone,:description,:email,:longitude, :latitude, :category_type, :active],
        images_attributes:[:image] )
    end
    
    def draw_password
      %w(password password_confirmation).each do |attr|
        params[:dealer].delete(attr)
      end if params[:dealer] && params[:dealer][:password].blank?
    end

    def category_type
      category_type = ['Dealer', 'Workshop']
      @category_type = category_type.map{|category_type| [category_type, category_type]}
    end

    def sex
      sex = ['Laki-Laki', 'Perempuan']
      @sex = sex.map{|sex| [sex, sex]}
    end

end