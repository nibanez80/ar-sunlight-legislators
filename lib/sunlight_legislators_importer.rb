require 'csv'
require_relative '../db/config'
require 'active_record'

class SunlightLegislatorsImporter
  class Legislator < ActiveRecord::Base
    
  end

  def self.import(filename)
    raise "NO FILE NAMED #{filename}" unless File.exists?(filename)
    #iterate through each row in the CSV file
      # push into the database!

    CSV.foreach(filename, :headers => true) do |row|
      row_hash = row.to_hash
      row_hash.delete("official_rss")
      p Legislator.create(row_hash)

    end
  end
end

begin
  raise ArgumentError, "you must supply a filename argument" unless ARGV.length == 1
  SunlightLegislatorsImporter.import(ARGV[0])
rescue ArgumentError => e
  $stderr.puts "Usage: ruby sunlight_legislators_importer.rb <legislators.csv>"
rescue NotImplementedError => e
  $stderr.puts "You shouldn't be running this until you've modified it with your implementation!"
end
