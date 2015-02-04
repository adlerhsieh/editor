require 'sinatra'
require 'json'

class Editor < Sinatra::Base
	require './app/validation'

	before "/data" do
	code_array = params[:code]
		if code_array.class == Array && code_array.length > 0
			@code_string = code_array.inject("") { |result, line| result += line + ";"}
		end
	end

	get "/" do
		redirect "/ace"
	end

	get "/ace" do
		erb :'ace.html', :layout => :'layout.html'
	end

	post "/data" do
		# @code_string += "Post.instance_methods.include? :hello;"
		result = eval @code_string
		return result.to_json
	end
end