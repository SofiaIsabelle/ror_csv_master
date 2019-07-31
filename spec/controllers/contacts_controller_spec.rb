require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

    describe "GET #index" do
    it "assigns @contacts" do
      contact = Contact.create
      get :index
      expect(assigns(:contacts)).to eq([contact])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #import" do
    it "redirects upon CSV import success to root url with success message" do
    end

    it "redirects upon CSV import exception to root url with error message" do
    end
  end

end

