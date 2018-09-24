require 'net/http'
require 'timeout'

class PingJob < ApplicationJob
	
self.queue_adapter = :async
queue_as :urgent

def ping
response = Net::HTTP.get('https://rkraftcomua.herokuapp.com', '/index.html')
Net::HTTP.start('https://rkraftcomua.herokuapp.com', 80, open_timeout: 5) do |http|
http.request response 
end
end

end