require 'net/http'
require 'json'

class ApiGeekController < ApplicationController

	def getVideo
		@result = Net::HTTP.get('confreaks.tv' ,'/api/v1/videos.json?limit=50')
		@resultSet = JSON.parse(@result)

		@resultSet.each do |i|
			unless Video.exists?(video_id: i["id"])
				Video.create(video_id: i["id"], title: i["title"], event: i["event"] ,abstract: i["abstract"])
			end
		end

		@data = Video.all
		render json: @data
	end
end
