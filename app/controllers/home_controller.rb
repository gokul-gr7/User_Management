class HomeController < ApplicationController
  def index
    @details = Detail.all
    session.clear
    puts "HomeController"
  end
  def form
    # @details = Detail.new
    @details = Detail.new(session[:details] || {})
  end 
  def create_form
    # @details = Detail.new(detail_params)
    # if @details.save
    #   redirect_to address_path
    # else
    #   render :form
    # end
    puts "Create form"

    @details = Detail.new(personal_params)

    if @details.valid?
      session[:details] = @details.attributes
      redirect_to address_path
    else
      render :form
    end
  end

  def address 
    # @ads = Living.new
    puts "Address"
    @ads = Living.new(session[:ads] || {})
  end

  def create_address
    # @ads = Living.new(location_params)
    # if @ads.save
    #   redirect_to office_path
    # else
    #   render :address
    # end 
    puts "create address"

        @ads = Living.new(address_params)

    if @ads.valid?
      session[:ads] = @ads.attributes
      redirect_to office_path
    else
      render :address
    end
  end 


  def office

    puts "office"
    # @employee = Office.new
    @employee = Office.new(session[:employee] || {})
  end

  def create_office
    # @employee = Office.new(office_params)

    @details = Detail.new(session[:form_data] || {})
    @ads = Living.new(session[:address_data] || {})
    @employee = Office.new(office_params)
    puts "\nOffice created\n"

    # if @employee.valid?
    #   @details.save
    #   @ads.save
    #   @employee.save

    #   # Clear session data after successful submission
    #   session[:details] = nil
    #   session[:ads] = nil
    #   session[:employee] = nil

    #   redirect_to root_path, notice: "Sucessfully submitted"
    # else
    #   puts "Please"
    #   redirect_to form_path
    # end
  end
  
 

  private 
  def detail_params
    params.require(:user).permit(:firstName,
     :lastName , :Email, :phone, :school, :tenth_percentage, :hsc_percentage, :college, :cgpa, :aadhaar, :pan, :profession, :instagram, :facebook, :twitter, :thread, :whatsapp, :fatherName, :MotherName, :Fathercontact, :MotherContact, :Marital, :FavColor, :DOB, :nickName)
  end

  def address_params 
    params.require(:location).permit(:Door_number,:Floor_number, :Building_name,  :Street_name, :Area ,:Post, :village, :Pincode, :Landmark, :City, :District, :State, :Country, :Continent, :Current_address)
  end

  def office_params
    params.require(:office).permit(:Company, :Role,:Employee_id, :Employee, :mail_id, :Laptop_serial,:Laptop_mode, :Laptop_Brand, :Laptop_Mac, :Hoodies,:Experience, :Account_number, :Bank_name, :Branch,:IFSC_code, :Account_holder)
  end
end 
