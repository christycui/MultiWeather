module ApplicationHelper
  def name_of_day(date)
    t = Time.now
    if date == t.strftime('%F')
      'Today'
    else
      # return weekday
      Time.new(date[0..3].to_i, date[5..6].to_i, date[8..9].to_i).strftime('%A')
    end
  end
  
  def name_lookup(city_id)
    source = Nokogiri::XML(open("http://api.geonames.org/get?geonameId=#{city_id}&username=christy931"))
    if source.at_xpath('geoname//adminCode1').nil?
      source.at_xpath('geoname//name').text + ', ' + source.at_xpath('geoname//countryCode').text
    else
      source.at_xpath('geoname//name').text + ', ' + (source.at_xpath('geoname//adminCode1').text.to_i == 0 ? source.at_xpath('geoname//adminCode1').text + ', ' : '') + source.at_xpath('geoname//countryCode').text
    end
  end
end
