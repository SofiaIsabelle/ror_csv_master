require 'rails_helper'

RSpec.describe Contact, type: :model do

  describe 'Class' do
    subject { Contact }

    it { should respond_to(:import) }

    let(:data) { "uid,phone,first,last,email" }

    describe "#import" do
      it "should create a new record if id does not exist" do
        File.stub(:open).with("filename", {:universal_newline=>false, :headers=>true}) {
          StringIO.new(data)
        }
        Product.import("filename")
        expect(Product.find_by(first: 'Adah').uid).to eq XcL0H
      end
    end
  end

end
