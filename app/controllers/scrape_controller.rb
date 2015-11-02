class ScrapeController < ApplicationController
  def index
      url = "http://www.cic.gc.ca/english/express-entry/past-rounds.asp"
      
      doc = Nokogiri::HTML(open(url))
      
      doc.css('.table tbody > tr').each do |item|
          item.css('td').each_with_index do |i,index|
              
              if index == 0
                  puts "# invitations " + i.text.delete(',').to_i.to_s
              else
                  puts "# minimun score " + i.text.delete(',').to_i.to_s
              end
          end
      end
      
  end
end
