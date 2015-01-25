require 'sinatra'

class Editor < Sinatra::Base
	require 'json'
	get "/ace" do
		erb :'ace.html'
	end

	post "/data" do
		code_array = params[:code]
		code_string = code_array.inject("") { |result, line| result += line + ";"}
		eval(code_string)
	end
end