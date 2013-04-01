require 'spec_helper'

describe "Gallery pages" do
  subject {page}


  describe "check the artist page" do
   before {visit artists_path}

    it {should have_selector('h1',    text: 'Artist Gallery')}
    it {should have_selector('title', text: full_title('Artist'))}
  end


  describe "check the artwork page" do
    before {visit artwork_path}

    it {should have_selector('h1',    text: 'Artwork Gallery')}
    it {should have_selector('title', text: full_title('Artwork'))}
  end
end