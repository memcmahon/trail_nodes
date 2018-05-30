require 'nokogiri'

Node.destroy_all

trails = [{file_name: "sky-pond.gpx", trail_id: 7002175},
          {file_name: "emerald-lake.gpx", trail_id: 7000276},
          {file_name: "royal-arch.gpx", trail_id: 7004682},
          {file_name: "walker-rach.gpx", trail_id: 7002439},
          {file_name: "sunshine-lions-lair-loop.gpx", trail_id: 7004226},
          {file_name: "monarch-lake-to-crater-lake.gpx", trail_id: 7006663},
          {file_name: "bear-peak.gpx", trail_id: 7000130},
          {file_name: "boulder-skyline-traverse.gpx", trail_id: 7011192},
          {file_name: "mount-sanitas-loop.gpx", trail_id: 7000000},
          {file_name: "ouzel-falls-back.gpx", trail_id: 7018920},
          {file_name: "longs-peak-keyhole-route.gpx", trail_id: 7000487},
          {file_name: "green-mountain-via-rangersaddle-rock-loop.gpx", trail_id: 7011191},
          {file_name: "high-lonesome-loop.gpx", trail_id: 7006795},
          {file_name: "best-of-bear-lake-area-loop.gpx", trail_id: 7001090},
          {file_name: "chasm-lake.gpx", trail_id: 7001041},
          {file_name: "pawnee-buchanan-loop.gpx", trail_id: 7010213},
          {file_name: "mt-bierstadt-west-slopes.gpx", trail_id: 7001739},
          {file_name: "chavez-and-beaver-brook-trail-loop.gpx", trail_id: 7011049},
          {file_name: "grays-and-torreys-peaks.gpx", trail_id: 7003636},
          {file_name: "south-arapaho-peak.gpx", trail_id: 7006885},
          {file_name: "deer-creek.gpx", trail_id: 7006771},
         ]

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
