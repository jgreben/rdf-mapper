#!/usr/bin/env ruby

require 'linkeddata'

rdf_file = ARGV[0]
serialize = ARGV[1]

graph = RDF::Graph.new

data = File.read(rdf_file)
json = JSON.parse(data)
graph << JSON::LD::API.toRdf(json)

puts "update=INSERT DATA { \n"
puts "	GRAPH <http://vitro.mannlib.cornell.edu/default/vitro-kb-2> { \n"
puts "#{graph.dump(serialize.to_sym)}\n"
puts "	}"
puts "}"
