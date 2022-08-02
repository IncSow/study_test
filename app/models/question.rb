class Question < ApplicationRecord
  require 'net/http'
  require 'net/https'
  def get_from_poke_api(category, option= "")
    uri = URI("https://pokeapi.co/api/v2/#{category}/#{option}")

    Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      request = Net::HTTP::Get.new uri
      response = http.request(request).body.to_json
    end
  end

end
