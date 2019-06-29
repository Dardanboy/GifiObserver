require 'net/http'

class HttpRequest
  attr_accessor :link, :http, :request

  def initialize(link)
    self.link = link
    uri = URI.parse(self.link)
    self.http = Net::HTTP.new(uri.host)
    self.request = Net::HTTP::Get.new(self.link)
  end

  def set_header (headers)
    headers.each do |header|
      self.request[header.at(0)] = header.at(1)
    end
  end

  def get_html
    self.http.request(self.request).body
  end
end
