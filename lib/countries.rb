module Countries
  API_COUNTRIES = {
    "21"=>{:code=>"ar", :name=>"Argentina "},
    "23"=>{:code=>"au", :name=>"Australia "},
    "26"=>{:code=>"be", :name=>"Belgium "},
    "29"=>{:code=>"br", :name=>"Brazil "},
    "33"=>{:code=>"ca", :name=>"Canada "},
    "307"=>{:code=>"cz", :name=>"Czech Republic "},
    "45"=>{:code=>"fr", :name=>"France "},
    "39"=>{:code=>"de", :name=>"Germany "},
    "327"=>{:code=>"gr", :name=>"Greece "},
    "331"=>{:code=>"hk", :name=>"Hong Kong "},
    "334"=>{:code=>"hu", :name=>"Hungary "},
    "265"=>{:code=>"is", :name=>"Iceland "},
    "337"=>{:code=>"in", :name=>"India "},
    "336"=>{:code=>"il", :name=>"Israel "},
    "269"=>{:code=>"it", :name=>"Italy "},
    "267"=>{:code=>"jp", :name=>"Japan "},
    "357"=>{:code=>"lt", :name=>"Lithuania "},
    "65"=>{:code=>"mx", :name=>"Mexico "},
    "67"=>{:code=>"nl", :name=>"Netherlands "},
    "392"=>{:code=>"pl", :name=>"Poland "},
    "268"=>{:code=>"pt", :name=>"Portugal "},
    "400"=>{:code=>"ro", :name=>"Romania "},
    "402"=>{:code=>"ru", :name=>"Russia"},
    "408"=>{:code=>"sg", :name=>"Singapore "},
    "412"=>{:code=>"sk", :name=>"Slovakia "},
    "447"=>{:code=>"za", :name=>"South Africa"},
    "348"=>{:code=>"kr", :name=>"South Korea"},
    "270"=>{:code=>"es", :name=>"Spain "},
    "73"=>{:code=>"se", :name=>"Sweden "},
    "34"=>{:code=>"ch", :name=>"Switzerland "},
    "425"=>{:code=>"th", :name=>"Thailand "},
    "432"=>{:code=>"tr", :name=>"Turkey "},
    "46"=>{:code=>"gb", :name=>"United Kingdom"},
    "78"=>{:code=>"us", :name=>"United States"}
  }
end

# result["ITEMS"].reduce({}) do |acc, country|
#   acc.store(country[0], { code: country[1], name: country[2] })
#   acc
# end
