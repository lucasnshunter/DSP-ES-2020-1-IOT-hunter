class CercaController < ApplicationController
  def home
    require 'csv'
    csv_text = File.read('...')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      Log.create!(row.to_hash)
    end
  end
end
