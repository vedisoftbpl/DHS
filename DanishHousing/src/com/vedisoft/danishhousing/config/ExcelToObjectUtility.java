package com.vedisoft.danishhousing.config;

import com.vedisoft.danishhousing.pojos.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelToObjectUtility {
	private static Workbook getWorkbook(FileInputStream inputStream, String excelFilePath) throws IOException {
		Workbook workbook = null;

		if (excelFilePath.endsWith("xlsx")) {
			workbook = new XSSFWorkbook(inputStream); // For Excel 2007 file
		} else if (excelFilePath.endsWith("xls")) {
			workbook = new HSSFWorkbook(inputStream); // For Excel 2003 file
		} else {
			throw new IllegalArgumentException("The specified file is not Excel file");
		}

		return workbook;
	}

	@SuppressWarnings("deprecation")
	private static Object getCellValue(Cell cell) {
		System.out.println(cell);
		if (cell.getCellType() == Cell.CELL_TYPE_NUMERIC) {
			System.out.println("Row No.: " + cell.getNumericCellValue());

			if (DateUtil.isCellDateFormatted(cell)) {
				System.out.println("Row No.: " + cell.getDateCellValue());
				return cell.getDateCellValue();
			}
			return cell.getNumericCellValue();
		} else if (cell.getCellType() == Cell.CELL_TYPE_STRING) {
			return cell.getStringCellValue();
		} else if (cell.getCellType() == Cell.CELL_TYPE_BOOLEAN) {
			return cell.getBooleanCellValue();
		}

		return null;

	}

	public static List<Projects> readProjectsFromExcelFile(String excelFilePath) throws IOException {
		List<Projects> projectList = new ArrayList<>();
		FileInputStream inputStream = new FileInputStream(new File(excelFilePath));

		Workbook workbook = getWorkbook(inputStream, excelFilePath);
		Sheet firstSheet = workbook.getSheetAt(0);
		Iterator<Row> iterator = firstSheet.iterator();
		boolean firstRow = true;
		while (iterator.hasNext()) {
			Row nextRow = iterator.next();
			if (firstRow == true) {
				firstRow = false;
				nextRow = iterator.next();
			}
			Iterator<Cell> cellIterator = nextRow.cellIterator();
			Projects project = new Projects();

			while (cellIterator.hasNext()) {
				Cell nextCell = cellIterator.next();
				int columnIndex = nextCell.getColumnIndex();

				switch (columnIndex) {
				case 0:
					project.setProjectId(((Double) getCellValue(nextCell)).intValue());
					break;
				case 1:
					project.setProjectName((String) getCellValue(nextCell));
					break;
				case 2:
					project.setBungProject(((String) getCellValue(nextCell)));
					break;
				}

			}
			projectList.add(project);
		}

		workbook.close();
		inputStream.close();

		return projectList;
	}

	public static List<Members> readMembersFromExcelFile(String excelFilePath) throws IOException {
		List<Members> memberList = new ArrayList<>();
		FileInputStream inputStream = new FileInputStream(new File(excelFilePath));

		Workbook workbook = getWorkbook(inputStream, excelFilePath);
		Sheet firstSheet = workbook.getSheetAt(1);
		Iterator<Row> iterator = firstSheet.iterator();
		boolean firstRow = true;
		while (iterator.hasNext()) {
			Row nextRow = iterator.next();
			if (firstRow == true) {
				firstRow = false;
				nextRow = iterator.next();
			}
			Iterator<Cell> cellIterator = nextRow.cellIterator();
			Members member = new Members();

			while (cellIterator.hasNext()) {
				Cell nextCell = cellIterator.next();
				int columnIndex = nextCell.getColumnIndex();

				if(getCellValue(nextCell) != null)
				{
				switch (columnIndex) {
				case 0:
					member.setProjectCd(((Double) getCellValue(nextCell)).intValue());
					break;
				case 1:
					member.setMemberNo(((Double) getCellValue(nextCell)).intValue());
					break;
				case 2:
					member.setPlotSize((String) getCellValue(nextCell));
					break;
				case 3:
					member.setNetPlotSize(((Double) getCellValue(nextCell)).floatValue());
					break;
				case 4:
					member.setRegCor((String) getCellValue(nextCell));
					break;
				case 5:
					member.setPlotNo((String) getCellValue(nextCell));
					break;
				case 6:
					member.setTempPlotNo((String) getCellValue(nextCell));
					break;
				case 7:
					member.setPrefix((String) getCellValue(nextCell));
					break;
				case 8:
					member.setMemName((String) getCellValue(nextCell));
					break;
				case 9:
					member.setAddress1((String) getCellValue(nextCell));
					break;
				case 10:
					member.setAddress2((String) getCellValue(nextCell));
					break;
				case 11:
					member.setAddress3((String) getCellValue(nextCell));
					break;
				case 12:
					member.setMobile(((Double) getCellValue(nextCell)).toString());
					break;
				case 13:
					member.setMemOccupation((String) getCellValue(nextCell));
					break;
				case 14:
					member.setAge(((Double) getCellValue(nextCell)).intValue());
					break;
				case 15:
					 member.setfHRelName((String) getCellValue(nextCell));
					 																	// //F_H name
					break;
				case 16:
					 member.setNomineeName((String) getCellValue(nextCell));
					 																		//Nominee name & relation
					break;
				case 17:
					member.setMemFee(((Double) getCellValue(nextCell)).intValue());
					break;
				case 18:
					member.setMemEntryFee(((Double) getCellValue(nextCell)).intValue());
					break;
				case 19:
					member.setReceiptdt((java.util.Date) getCellValue(nextCell));
					break;
				case 20:
					member.setFullPay((String) getCellValue(nextCell));
					break;
				case 21:
					member.setInst1((String) getCellValue(nextCell));
					break;
				case 22:
					member.setInst2((String) getCellValue(nextCell));
					break;
				case 23:
					member.setInst3((String) getCellValue(nextCell));
					break;
				case 24:
					member.setTransf((String) getCellValue(nextCell));
					break;
				case 25:
					member.setOpBal((Double) getCellValue(nextCell));
					break;
				case 26:
					member.setWaterConn((Double) getCellValue(nextCell));
					break;
				case 27:
					member.setSecDep((Double) getCellValue(nextCell));
					break;
				case 28:
					member.setWaterConnDate((java.util.Date) getCellValue(nextCell));
					break;
				case 29:
					member.setOpDt((java.util.Date) getCellValue(nextCell));
					break;	
				case 30:
					member.setRegi((String) getCellValue(nextCell));
					break;
				case 31:
					member.setRegDt((java.util.Date) getCellValue(nextCell));
					break;
				case 32:
					member.setRegNo(((Double) getCellValue(nextCell)).intValue());
					break;
				case 33:
					member.setrC(((String)getCellValue(nextCell)).charAt(0));
					break;
				case 34:
					member.setNocDt((java.util.Date) getCellValue(nextCell));
					break;
				case 35:
					member.setLiveDead(((String) getCellValue(nextCell)).charAt(0));
					break;
				case 36:
					member.setRefDt((java.util.Date) getCellValue(nextCell));
					break;
//				case 37:
//					member.setre((String) getCellValue(nextCell));
//					break;
				case 38:
					member.setDiversion((double) getCellValue(nextCell));
					break;
				case 39:
					member.setMaint((Double) getCellValue(nextCell));
					break;
				case 40:
					member.setWater((String) getCellValue(nextCell));
					break;
				case 41:
					member.setWatSupplyDt((java.util.Date) getCellValue(nextCell));
					break;
				case 42:
					member.setFinalAmount((double) getCellValue(nextCell));
					break;
				case 43:
					member.setEstabl((Double) getCellValue(nextCell));
					break;
				case 44:
					member.setWcLrDt((java.util.Date) getCellValue(nextCell));
					break;
				case 45:
					member.setWatChg((Double) getCellValue(nextCell));
					break;
				case 46:
					member.setExtraAmount((double) getCellValue(nextCell));
					break;
				case 47:
					member.setCost((double) getCellValue(nextCell));
					break;
				case 48:
					//REF_FLAG
					break;
				case 49:
					//REF_FLAG1
					break;
				case 50:
					//FLAG_DEF
					break;
				case 51:
					//FLAG2
					break;
				case 52:
					member.setBuildFlag((String) getCellValue(nextCell));
					break;
				case 53:
					member.setmNominal((String) getCellValue(nextCell));
					break;
				case 54:
					member.setMutaNo1(((Double) getCellValue(nextCell)).intValue());
					break;
				case 55:
					member.setMutaDt1((java.util.Date) getCellValue(nextCell));
					break;
				case 56:
					//LR_YR11
					break;
				case 57:
					//LR_YR12
					break;
				case 58:
					//LR_RATE
					break;
				case 59:
					member.setGender((String) getCellValue(nextCell));
					break;
				case 60:
					member.setCategory((String) getCellValue(nextCell));
					break;
				case 61:
					//LOAN
					break;
				case 62:
					member.setDefaulter((String) getCellValue(nextCell));
					break;
				case 63:
					member.setMotherName((String) getCellValue(nextCell));
					break;
				case 64:
					member.setPanNo((String) getCellValue(nextCell));
					break;
				case 65:
					member.setDob((java.util.Date) getCellValue(nextCell));
					break;
				case 66:
					member.setEliInl((String) getCellValue(nextCell));
					break;
				}
				
				}

			}
			memberList.add(member);
		}

		workbook.close();
		inputStream.close();

		return memberList;
	}

	public static void main(String args[]) {
		try {
			
			List<Members> projectList = ExcelToObjectUtility.readMembersFromExcelFile("F:\\Projects\\DHS\\Level2\\MEMBER_DATA_FROM_1_TO_1000.xls");
			for (Members p : projectList) {
				System.out.println(p);
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
