require 'sinatra'
require 'json'

class Editor < Sinatra::Base
	get "/ace" do
		erb :'ace.html'
	end

	post "/data" do
		code_array = params[:code]
		code_string = code_array.inject("") { |result, line| result += line + ";"}
		code_string += "Post.instance_methods.include? :hello;"
		# a = "-> {#{code_string}}"
		# result = (eval a).call
		result = eval code_string
		return result.to_json
		# return code_string
	end
end