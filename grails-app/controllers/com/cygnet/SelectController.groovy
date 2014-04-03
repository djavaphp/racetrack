package com.cygnet

import grails.converters.JSON

class SelectController {

  static states = ['KS': 'Kansas', 'OK': 'Oklahoma']
  static cities = ['KS': ['1': 'Dodge City', '2': 'Topeka', '3': 'Wichita'], 'OK': ['4': 'Norman', '5': 'Stillwater', '6': 'Tulsa']]

  def index() {
    [states: states]
  }

  def citiesByState() {
    def stateCities = cities[params.stateAbbrv]
    withFormat {
      html {
        render template: 'cities', model: [cities: stateCities]
      }
      json {
        render stateCities as JSON
      }
    }

  }
}
	
    