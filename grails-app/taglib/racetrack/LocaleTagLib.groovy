package racetrack

import org.springframework.web.servlet.support.RequestContextUtils;
import groovy.xml.MarkupBuilder;
import racetrack.Race

class LocaleTagLib {
	static namespace = 'locale'
	
   List<Locale> locales = [Locale.GERMAN, Locale.ENGLISH]

   /**
	* Renders a locale selector.
	* Adds the class <code>active</code> to the list-element of the current language.
	*/
   def selector = {
	   Locale requestLocale = RequestContextUtils.getLocale(request)
		
	   MarkupBuilder mb = new MarkupBuilder(out)
	   mb.ul('id': 'locale-selector') {
		   locales.each { Locale locale ->
			   li(requestLocale.language == locale.language ? ['class': 'active'] : [:]) {
				   mb.yield(
					   link( controller: "race", action: "create", params: params + [lang: locale.language],
							{ locale.getDisplayLanguage(locale) } ).toString(),
					   false
					   )
			   }
		   }
	   }
   }

}
