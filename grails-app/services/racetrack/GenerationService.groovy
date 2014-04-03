package racetrack


class GenerationService{
	
	def excelImportService
	
	def generate(){
		
	Map CONFIG_RUNNER_COLUMN_MAP = [
			sheet:'Sheet1',
			startRow: 2,
			columnMap:  [
					'A':'firstName',
					'B':'email',
					'C':'address',
					'D':'accout num'
					]
	]
	}
	
	List<Map> getParticipants() {
		List bookList = excelImportService.columns(workbook, CONFIG_BOOK_COLUMN_MAP)
	  }
   
}
