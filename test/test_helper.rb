require 'rubygems'
require 'test/unit'

require File.join(File.dirname(__FILE__), '..', 'lib', 'p4d')

$quote_hash = {:collection_name => 'Chris Mowforth',
              :collection_address_1 => '5 Dove Lane',
              :collection_town => 'Henley on Thames',
              :collection_county => 'Oxon',
              :collection_postcode => 'RG9 5RQ',
              :collection_telephone => '01491 628064',
              :delivery_name => 'Fred Bloggs',
              :delivery_address_1 => '123 Fake Street',
              :delivery_county => 'Oxfordshire',
              :delivery_town => 'Oxford',
              :delivery_postcode => 'OX11',
              :delivery_country => 'UK',
              :delivery_telephone => '01322 123 456',
              :weight => '100',
              :width => '10',
              :height => '10',
              :length => '10',
              :parcel_contents => 'gift',
              :estimated_value => '100'}

include P4D