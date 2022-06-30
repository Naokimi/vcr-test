class ApiCaller < ApplicationRecord
  include HTTParty
  base_uri 'mugenmonkey.com/api/v0'

  def builds_to_lvl_20
    response = self.class.get('/ds3_builds?level_to=20')
    JSON.parse(response.body)
  end

  def builds_from_lvl_20
    response = self.class.get('/ds3_builds?level_from=20')
    JSON.parse(response.body)
  end
end
