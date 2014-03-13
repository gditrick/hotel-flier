module Utilities
  class HotelFlierPdfGenerator
    @queue = :hotel_flier_queue
    def self.perform(hotel_id)
      hotel = Hotel[hotel_id]
      flier = hotel.current_flier || HotelFlier.create(hotel: hotel, day: Date.today)

      w = RbWunderground::Base.new(ENV["WUNDERGROUND_KEY"])

      begin
        cc = w.geolookup_and_forecast_and_hourly(URI.encode(hotel.location))
      rescue Exception => e
        flier.message = 'Weather Information unavailable'
      end

      if cc.response.error
        flier.message = cc.response.error.description + ':Check your address'
        cc = nil
      end

      pdf = Prawn::Document.new

      pdf.font "Helvetica"

      pdf.define_grid(columns: 5, rows: 20, gutter: 10)

      pdf.grid([0,0], [3,1]).bounding_box do
        pdf.text hotel.name.possessive + " Daily Flier", size: 18
        pdf.stroke_horizontal_rule
        pdf.move_down 3
        pdf.text hotel.address, size: 12
        pdf.text hotel.phone, size: 10
        pdf.text "<u><link href='#{hotel.website}'>Official Website</link></u>",
                 inline_format: 10,
                 size: 10
      end

      if cc
        pdf.grid([0,3], [3,4]).bounding_box do
          pdf.text "Time Zone: " + cc.location.tz_long +
                   " (" + cc.location.tz_short + ")", size: 10
          pdf.text "Lat: " + cc.location.lat,   size: 10
          pdf.text "  Lon: " + cc.location.lon, size: 10
        end
      end

      pdf.grid([4,0], [4,3]).bounding_box do
        pdf.text "Forecast", valign: :bottom, style: :bold_italic, align: :left
        pdf.text "brought to by", style: :bold_italic, valign: :bottom, align: :right
        pdf.stroke_horizontal_rule
      end
      pdf.grid([4,4], [4,4]).bounding_box do
        pdf.image "#{Rails.root}/app/assets/images/wundergroundLogo100x59_black.jpg",
                  at: [0, pdf.cursor]
      end
      if cc
        pdf.grid([5,0], [15,3]).bounding_box do
          pdf.move_down 8
          pdf.default_leading = 3
          cc.forecast.txt_forecast.forecastday.each do |period|
            pdf.text period.title, size: 12, style: :bold
            pdf.indent(20) do
              pdf.text period.fcttext, size: 10, leading: 3
            end
            pdf.move_down 8
          end
        end
      end

      pdf.grid([16,0], [19,4]).bounding_box do
        pdf.text "Message of the Day", style: :bold_italic
        pdf.stroke_horizontal_rule
        pdf.move_down 3
        pdf.text flier.message, size: 10
      end

      pdf.bounding_box([pdf.bounds.right - 50, pdf.bounds.bottom], width: 60, height: 20) do
        page_count = pdf.page_count
        pdf.text "Page #{page_count}"
      end

      flier.flier_pdf = pdf.render

      flier.save
    end
  end
end