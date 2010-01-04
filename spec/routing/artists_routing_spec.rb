require 'spec_helper'

describe ArtistsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/artists" }.should route_to(:controller => "artists", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/artists/new" }.should route_to(:controller => "artists", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/artists/1" }.should route_to(:controller => "artists", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/artists/1/edit" }.should route_to(:controller => "artists", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/artists" }.should route_to(:controller => "artists", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/artists/1" }.should route_to(:controller => "artists", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/artists/1" }.should route_to(:controller => "artists", :action => "destroy", :id => "1") 
    end
  end
end
