#!/usr/bin/env ruby

require 'linkeddata'

rdf_file = ARGV[0]
serialize = ARGV[1]

repo = RDF::Repository.new

RDF::NTriples::Reader.open(rdf_file) do |reader|
	reader.each_statement do |statement|
		repo << statement
	end
end

puts "update=INSERT DATA { \n"
puts "  GRAPH <http://vitro.mannlib.cornell.edu/default/vitro-kb-2> { \n"
puts "#{repo.dump(serialize.to_sym)}\n"
puts "  }"
puts "}"
