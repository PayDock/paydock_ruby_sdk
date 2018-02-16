require "net/http"
require 'uri'
require 'json'
require_relative '../paydock'
require_relative 'http_request'
require_relative "http_method"
require_relative "service_helper"
require_relative "../Services/config"
require_relative "../Services/environment"


def add_charge(body)
	url = Config.baseURL
	uri = url+"charges/"
	ServiceHelper.callPaydock(uri,HTTP_method.POST, body)
end

def authorise(body)
	url = Config.baseURL
	uri = url+"charges/?capture=false"
	ServiceHelper.callPaydock(uri,HTTP_method.POST,body)
end

def capture(body,id)
	url = Config.baseURL
	uri = url+"charges/"+id+"/capture"
	ServiceHelper.callPaydock(uri,HTTP_method.POST,body)
end