require 'rails_helper'

describe Art do
  context "validation" do
    it { should validate_presence_of("title") }
    it { should ensure_length_of("title").is_at_least(10).is_at_most(49) }
    it { should validate_presence_of("description") }
    it { should validate_presence_of("category_cd") }
    it { should validate_inclusion_of("category_cd").in_range(0..2) }
    it { should validate_presence_of("width") }
    it { should validate_inclusion_of("width").in_range(10..200) }
    it { should validate_presence_of("height") }
    it { should validate_inclusion_of("height").in_range(10..200) }
    it { should validate_presence_of("filename") }
    it { should validate_presence_of("year") }
    it { should validate_inclusion_of("year").in_range(2010..Date.today.year) }
    it { should validate_presence_of("medium") }
  end

  describe "process_uploaded_file" do
    context "when a file is uploaded" do
        let(:art) { Art.new }
        let(:file) { 
            test_image = Rails.root + "public/images/caitlyn.png"
            Rack::Test::UploadedFile.new(test_image, "image/jpeg")
        }

        before(:each) do
            allow(file).to receive_message_chain(:read).and_return("test")
            allow(File).to receive_message_chain(:open, :write).and_return("stubbed")
        end

        subject { art.process_uploaded_file(file) }

        it { is_expected.to eq("#{ENV["UPLOADED_FILE_RELATIVE_PATH"]}/caitlyn.png") }
      end
    end
end