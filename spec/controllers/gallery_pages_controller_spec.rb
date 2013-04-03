require 'spec_helper'

describe GalleryPagesController do

  describe "GET 'artwork'" do
    it "returns http success" do
      get 'artwork'
      response.should be_success
    end
  end

  describe "GET 'artists'" do
    it "returns http success" do
      get 'artists'
      response.should be_success
    end
  end
end
