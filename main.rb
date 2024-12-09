require 'sinatra'
require 'sinatra/cross_origin'
require 'json'

# Enable CORS
configure do
  enable :cross_origin
end

# Set CORS headers before each request
before do
  response.headers['Access-Control-Allow-Origin'] = '*'
  response.headers['Access-Control-Allow-Methods'] = 'GET, POST, OPTIONS'
  response.headers['Access-Control-Allow-Headers'] = 'Content-Type'
end

# Handle preflight requests (optional but good practice)
options '*' do
  200
end

# Data to serve for Table 1
TABLE1 = {
  "A1" => 41, "A2" => 18, "A3" => 21, "A4" => 63, "A5" => 2,
  "A6" => 53, "A7" => 5, "A8" => 57, "A9" => 60, "A10" => 93,
  "A11" => 28, "A12" => 3, "A13" => 90, "A14" => 39, "A15" => 80,
  "A16" => 88, "A17" => 49, "A18" => 60, "A19" => 26, "A20" => 28
}

# Endpoint to serve table data
get '/table-data' do
  # Compute Table 2 values
  alpha = "A5 + A20 = #{TABLE1["A5"] + TABLE1["A20"]}"
  beta = "A15 / A7 = #{TABLE1["A15"] / TABLE1["A7"]}"
  charlie = "A13 * A12 = #{TABLE1["A13"] * TABLE1["A12"]}"

  # Return data as JSON
  {
    table1: TABLE1,
    table2: { alpha: alpha, beta: beta, charlie: charlie }
  }.to_json
end
