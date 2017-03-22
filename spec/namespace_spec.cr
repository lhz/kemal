require "./spec_helper"

describe "Namespaced routes" do

  describe "no namespace" do
    it "matches the correct route" do
      get "/foo" do |env|
        "Foo"
      end
      request = HTTP::Request.new("GET", "/foo")
      client_response = call_request_on_app(request)
      client_response.body.should eq("Foo")
    end
  end

  describe "single namespace" do
    it "matches the correct route" do
      namespace "/single" do
        get "/bar" do |env|
          "Bar"
        end
      end
      request = HTTP::Request.new("GET", "/single/bar")
      client_response = call_request_on_app(request)
      client_response.body.should eq("Bar")
    end
  end

  describe "nested" do
    it "matches the correct route" do
      namespace "/outer" do
        namespace "/inner" do
          get "/baz" do |env|
            "Baz"
          end
        end
      end
      request = HTTP::Request.new("GET", "/outer/inner/baz")
      client_response = call_request_on_app(request)
      client_response.body.should eq("Baz")
    end
  end
end
