class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_models_from_session, only: [:form, :create_form, :address, :create_address, :office, :create_office]

  def index
    puts "HomeController"
    @results = params[:query].present? ? search_solr(params[:query]) : []
  end

  def form
    @details = Detail.new
  end

  def create_form
    @details = Detail.new(detail_params)
    if @details.valid?
      session[:details] = @details.attributes
      redirect_to address_details_path
    else
      render :form
    end
  end

  def address
    @ads = Living.new
  end

  def create_address
    @ads = Living.new(address_params)
    if @ads.valid?
      session[:ads] = @ads.attributes
      redirect_to office_details_path
    else
      render :address
    end
  end

  def office
    @employee = Office.new
  end

  def create_office
    @employee = Office.new(office_params)
    if @employee.valid?
      ActiveRecord::Base.transaction do
        @details.save!
        @ads.save!
        @employee.save!

        solr = connect_to_solr
        solr.add([
          @details.attributes.merge(id: @details.id),
          @ads.attributes.merge(id: @ads.id),
          @employee.attributes.merge(id: @employee.id)
        ])
        solr.commit

        session[:details] = nil
        session[:ads] = nil
        session[:employee] = nil

        redirect_to root_path, notice: "Successfully submitted"
      end
    else
      render :office
    end
  rescue RSolr::Error::ConnectionRefused => e
    redirect_to form_path, alert: "Failed to submit due to Solr connection error."
  end



  private

  def set_models_from_session
    @details = Detail.new(session[:details] || {})
    @ads = Living.new(session[:ads] || {})
    @employee = Office.new(session[:employee] || {})
  end

  def connect_to_solr
    RSolr.connect(url: 'http://localhost:8983/solr/user_management')
  end

  def detail_params
    params.require(:detail).permit(:firstName, :lastName, :Email, :phone, :school, :tenth_percentage, :hsc_percentage, :college, :cgpa, :aadhaar, :pan, :profession, :instagram, :facebook, :twitter, :thread, :whatsapp, :fatherName, :MotherName, :Fathercontact, :MotherContact, :Marital, :FavColor, :DOB, :nickName)
  end

  def address_params
    params.require(:living).permit(:Door_number, :Floor_number, :Building_name, :Street_name, :Area, :Post, :village, :Pincode, :Landmark, :City, :District, :State, :Country, :Continent, :Current_address)
  end

  def office_params
    params.require(:office).permit(:Company, :Role, :Employee_id, :Employee, :mail_id, :Laptop_serial, :Laptop_mode, :Laptop_Brand, :Laptop_Mac, :Hoodies, :Experience, :Account_number, :Bank_name, :Branch, :IFSC_code, :Account_holder)
  end

  def search_solr(query)
    solr = RSolr.connect(url: 'http://localhost:8983/solr/user_management')
    response = solr.get('select', params: { q: query })
    docs = response['response']['docs']
    return docs
  rescue RSolr::Error::ConnectionRefused => e
    return []
  end
end