package racetrack

import org.grails.plugins.excelimport.*
import racetrack.Participants

class ExcelImporter extends AbstractExcelImporter{
	def getExcelImportService() {
		ExcelImportService.getService()
	}
	
	static Map CONFIG_RUNNER_COLUMN_MAP = [
		sheet:'Sheet1',
		startRow: 1,
		columnMap:  [
				'A':'name',
				'B':'email',
				'C':'address',
				'D':'zipcode' 
				]
]

public ExcelImporter(fileName)
{
	super(fileName)
}
	
	List<Map> getParticipants() {
		List participantList = excelImportService.columns(workbook, CONFIG_RUNNER_COLUMN_MAP)
	  }
}
