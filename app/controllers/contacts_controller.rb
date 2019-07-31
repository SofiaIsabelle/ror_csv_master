class ContactsController < ApplicationController
    include ContactsHelper
    helper_method :sort_column, :sort_direction
  
    def index
      @contacts = Contact.search(contact_params[:search])
                         .order(sort_column + " " + sort_direction)
                         .paginate(:per_page => 3, :page => contact_params[:page])
    end
  
    def import
      
      begin
        file = contact_params[:file]
        file_path = file.path
        Contact.import(file_path)
        redirect_to root_url, notice: "Imported CSV file."
      rescue
        redirect_to root_url, notice: "Invalid CSV file format."
      end
    end
  
    private
  def sort_column
     Contact.column_defaults.include?(contact_params[:sort]) ? contact_params[:sort] : "first"
  end
  
    def sort_direction
      %w[asc desc].include?(contact_params[:direction]) ? contact_params[:direction] : "asc"
    end
  
    def contact_params
      params.permit(:uid, :phone, :first, :last, :email,
                    :file, :search, :page, :sort, :utf8,
                    :authenticity_token, :commit, :direction, :_)
      end
  end
  
  