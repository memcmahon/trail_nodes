require 'nokogiri'

Node.destroy_all

trails = [{file_name: "sky-pond.gpx", trail_id: 7002175},
          {file_name: "emerald-lake.gpx", trail_id: 7000276}]

trails.each do |trail|
  path = File.expand_path("../xml_files/#{trail[:file_name]}", __FILE__)
  doc = Nokogiri::XML(open(path))
  points = doc.xpath('//xmlns:trkpt')

  points.each do |point|
    lat = point.xpath('@lat').to_s.to_f
    lon = point.xpath('@lon').to_s.to_f
    ele = point.text.strip.to_f
    Node.create!(trail_id: trail[:trail_id], latitude: lat,
                longitude: lon, elevation: ele)
    puts "Created Node #{Node.last.id}"
  end
end
