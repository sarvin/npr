module NPR
  API_URL = 'http://api.npr.org/query'
  FORMAT = 'json'

  require 'open-uri'
  require 'addressable/template'

  def self.get_latest(channel)
    url = generate_url(channel.api_id)
    buffer = open(url).read
    hash = JSON.parse buffer
  end

  def self.generate_url(api_id)
    template = Addressable::Template.new("#{API_URL}{?query*}")
    template.expand({
      query: {
        id: api_id,
        apiKey: Rails.configuration.x.api_key,
        output: FORMAT
      }
    }).to_s
  end
end
