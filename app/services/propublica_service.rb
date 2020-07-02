class PropublicaService

  def members_of_house(state)
    response = conn.get("/congress/v1/members/house/#{state}/current.json")
    json = JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    url = "https://api.propublica.org"  
    Faraday.new(url) do |faraday|
     faraday.headers["X-API-KEY"] = ENV["PROPUBLICA_API_KEY"]
    end
  end
end
