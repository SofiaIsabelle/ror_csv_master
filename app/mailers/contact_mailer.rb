
class ContactMailer < ApplicationMailer
    default from: 'notifications@example.com'
   
    def contact_email
      @contact = params[:contact]
      @url  = 'http://example.com/login'
      mail(to: @contact.email, subject: 'Welcome to My CSV Site!')
    end
  end