require 'net/http'

class HttpRequest
  attr_accessor :link, :http, :request, :headers

  def initialize(link)
    self.headers = {}
    self.link = link
    uri = URI.parse(self.link)
    self.http = Net::HTTP.new(uri.host)
  end

  def set_header (headers)
    headers.each do |header|
      self.headers[header.at(0)] = header.at(1)
    end
  end

  def get
    set_request_action("GET")
    send_request_and_get_resp.body
  end

  def post(key_with_values)
    set_request_action("POST")
    self.request.body = ""

    key_with_values.each_with_index do |pair, index|
      self.request.body += pair.join("=")
      self.request.body += "&" if index < key_with_values.length-1
    end
    send_request_and_get_resp.body
  end

  def send_request_and_get_resp
    self.http.request(self.request)
  end


  private

  def set_request_action(action)
    self.request = Net::HTTP::Post.new(self.link) if action === "POST"
    self.request = Net::HTTP::Get.new(self.link) if action === "GET"

    set_headers
  end

  def set_headers
    self.headers.each do |pair|
      self.request[pair.at(0)] = pair.at(1)
    end
  end

end
