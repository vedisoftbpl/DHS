package com.vedisoft.danishhousing.config;

import com.vedisoft.danishhousing.pojos.*;
import com.vedisoft.danishhousing.daos.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
				case 3:
					project.setPad1(((String) getCellValue(nextCell)));
					break;
				case 4:
					project.setPad2(((String) getCellValue(nextCell)));
					break;
				case 5:
					project.setPad3(((String) getCellValue(nextCell)));
					break;
				case 6:
					project.setOpDate((java.util.Date) getCellValue(nextCell));
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
			Members member = new Members();

			while (cellIterator.hasNext()) {
				Cell nextCell = cellIterator.next();
				int columnIndex = nextCell.getColumnIndex();

				if (getCellValue(nextCell) != null) {
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
						member.setMobile(((String) getCellValue(nextCell)));
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
						// Nominee name & relation
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
						member.setWaterConn((double) getCellValue(nextCell));
						break;
					case 27:
						member.setSecDep((double) getCellValue(nextCell));
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
						// Cell cell=nextCell;
						// if(((String) getCellValue(cell)).contains("/")){
						// String s[]=((String) getCellValue(cell)).split("/");
						// member.setRegNo(Integer.parseInt(s[0]));
						// member.setCol2(s[1]);
						// }else
						member.setRegNo(((String) getCellValue(nextCell)));
						break;
					case 33:
						member.setrC(((String) getCellValue(nextCell)).charAt(0));
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
					case 37:
						member.setRefAmt((double) getCellValue(nextCell));
						break;
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
						// REF_FLAG
						break;
					case 49:
						// REF_FLAG1
						break;
					case 50:
						// FLAG_DEF
						break;
					case 51:
						// FLAG2
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
						// LR_YR11
						break;
					case 57:
						// LR_YR12
						break;
					case 58:
						// LR_RATE
						break;
					case 59:
						member.setGender((String) getCellValue(nextCell));
						break;
					case 60:
						member.setCategory((String) getCellValue(nextCell));
						break;
					case 61:
						// LOAN
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

	public static List<Account> readAccountFromExcelFile(String excelFilePath) throws IOException {
		List<Account> accountList = new ArrayList<>();
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
			Account account = new Account();

			while (cellIterator.hasNext()) {
				Cell nextCell = cellIterator.next();
				int columnIndex = nextCell.getColumnIndex();
				if (getCellValue(nextCell) != null) {
					switch (columnIndex) {
					case 0:
						account.setCoCode((String) getCellValue(nextCell));
						break;
					case 1:
						account.setBkCode(((String) getCellValue(nextCell)));
						break;

					case 2:
						account.setBkName(((String) getCellValue(nextCell)));
						break;
					case 3:
						account.setOpDate(((java.util.Date) getCellValue(nextCell)));
						break;
					case 4:
						account.setOpBal(((double) getCellValue(nextCell)));
						break;
					case 5:
						account.setReceipt(((double) getCellValue(nextCell)));
						break;

					case 6:
						account.setOpDate(((java.util.Date) getCellValue(nextCell)));
						break;

					case 7:
						account.setClBal(((double) getCellValue(nextCell)));
						break;

					case 8:
						account.setIfsc(((String) getCellValue(nextCell)));
						break;

					case 9:
						account.setBranch(((String) getCellValue(nextCell)));
						break;

					}
				}
			}
			accountList.add(account);
		}

		workbook.close();
		inputStream.close();

		return accountList;
	}

	public static List<AccountMaster> readAccountMasterFromExcelFile(String excelFilePath) throws IOException {
		List<AccountMaster> accountMasterList = new ArrayList<>();
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
			AccountMaster accountMaster = new AccountMaster();

			while (cellIterator.hasNext()) {
				Cell nextCell = cellIterator.next();
				int columnIndex = nextCell.getColumnIndex();

				switch (columnIndex) {
				// case 0:
				// account.setAccountId(((Double)
				// getCellValue(nextCell)).intValue());
				// break;
				case 0:
					accountMaster.setAnxCd(Integer.parseInt(((String) getCellValue(nextCell)).trim()));
					break;
				case 1:
					accountMaster.setAcCode(((String) getCellValue(nextCell)));
					break;

				case 2:
					accountMaster.setAcName(((String) getCellValue(nextCell)));
					break;

				case 3:
					accountMaster.setAddress(((String) getCellValue(nextCell)));
					break;
				case 4:
					accountMaster.setAcClass(((String) getCellValue(nextCell)));
					break;

				case 5:
					accountMaster.setOpdte(((java.util.Date) getCellValue(nextCell)));
					break;

				case 6:
					accountMaster.setOpBal(((Double) getCellValue(nextCell)));
					break;

				case 7:
					accountMaster.setmBal(((Double) getCellValue(nextCell)));
					break;

				case 8:
					accountMaster.setPexp(((String) getCellValue(nextCell)));
					break;
				case 9:
					accountMaster.setIxpge(((String) getCellValue(nextCell)));
					break;
				case 10:
					accountMaster.setFlag(((String) getCellValue(nextCell)));
					break;
				case 11:
					accountMaster.setProjCd(((Double) getCellValue(nextCell)).intValue());
					break;

				}

			}
			accountMasterList.add(accountMaster);
		}

		workbook.close();
		inputStream.close();

		return accountMasterList;
	}

	public static List<ReceiptRecord> readReceiptRecordFromExcelFile(String excelFilePath) throws IOException {
		List<ReceiptRecord> receiptList = new ArrayList<>();
		FileInputStream inputStream = new FileInputStream(new File(excelFilePath));

		Workbook workbook = getWorkbook(inputStream, excelFilePath);
		Sheet firstSheet = workbook.getSheetAt(5); ///////
		Iterator<Row> iterator = firstSheet.iterator();
		boolean firstRow = true;
		while (iterator.hasNext()) {
			Row nextRow = iterator.next();
			if (firstRow == true) {
				firstRow = false;
				nextRow = iterator.next();
			}
			Iterator<Cell> cellIterator = nextRow.cellIterator();
			ReceiptRecord receipt = new ReceiptRecord();
			double d =0,e=0;
			double balchq=0;
			while (cellIterator.hasNext()) {
				Cell nextCell = cellIterator.next();
				int columnIndex = nextCell.getColumnIndex();
				receipt.setAmount(0.0);
				if (getCellValue(nextCell) != null) {
					switch (columnIndex) {
					case 0:
						receipt.setsNo(((Double) getCellValue(nextCell)).intValue());
						break;
					case 1:
						receipt.setPayType(((String) getCellValue(nextCell)).charAt(0));
						break;
					case 2:
						receipt.setSlno(((Double) getCellValue(nextCell)).intValue());
						break;

					case 3:
						receipt.setRecDte(((java.util.Date) getCellValue(nextCell)));
						break;

					case 4:
						Cell c = nextCell;
						if (getCellValue(c) instanceof Double) {
							receipt.setReceno(((Double) getCellValue(nextCell)).intValue());
							receipt.setReceiptNo(new Integer(((Double) getCellValue(nextCell)).intValue()).toString());
						} else {
							String rec=((String)getCellValue(c)).trim();
							if(isNumeric(rec))
								receipt.setReceno((Integer.parseInt(rec)));
							receipt.setReceiptNo(((String) getCellValue(nextCell)));
						}
						System.out.println("Rec="+receipt.getReceno());
						break;

					case 5:
						receipt.setPrefix((String) getCellValue(nextCell));
						break;
					case 6:
						receipt.setMembNme((String) getCellValue(nextCell));
						break;
					case 7:
						receipt.setMembNo(((Double) getCellValue(nextCell)).intValue());
						break;

					case 8:
						receipt.setfHNme((String) getCellValue(nextCell));
						// //F_H name
						break;
					case 9:
						receipt.setMad1((String) getCellValue(nextCell));
						break;
					case 10:
						receipt.setMad2((String) getCellValue(nextCell));
						break;
					case 11:
						receipt.setMad3((String) getCellValue(nextCell));
						break;
					case 12:
						d = (double) getCellValue(nextCell); 
						
						break;
					case 13:
						 e = (double) getCellValue(nextCell); 
					
						
						break;
					case 14:
						balchq=(double) getCellValue(nextCell);
						break;
					case 15:
						if ((getCellValue(nextCell)) instanceof Double)
							receipt.setcDd(((Double) getCellValue(nextCell)).toString());
						else
							receipt.setcDd(((String) getCellValue(nextCell)));
						break;
					case 16:
						receipt.setcDdte((java.util.Date) getCellValue(nextCell));
						break;
					case 17:
						receipt.setFullPay((String) getCellValue(nextCell));
						break;
					case 18:
						receipt.setInst1((String) getCellValue(nextCell));
						break;
					case 19:
						receipt.setInst2((String) getCellValue(nextCell));
						break;
					case 20:
						receipt.setInst3((String) getCellValue(nextCell));
						break;
					case 21:
						receipt.setChalNo(((Double) getCellValue(nextCell)).intValue());
						break;
					case 22:
						receipt.setChalDte((java.util.Date) getCellValue(nextCell));
						break;
					case 23:
						if ((getCellValue(nextCell)) instanceof Double)
						receipt.setPlSize(((Double) getCellValue(nextCell)).toString());
						else
							receipt.setPlSize(((String) getCellValue(nextCell)));
						break;
					case 24:
						if ((getCellValue(nextCell)) instanceof Double)
						receipt.setPlNo(((Double) getCellValue(nextCell)).toString());
						else
							receipt.setPlNo(((String) getCellValue(nextCell)));
						break;

					case 25:
						receipt.setProjCd(((Double) getCellValue(nextCell)).intValue());
						break;
					case 26:
						if ((getCellValue(nextCell)) instanceof Double)
						receipt.setChqDhr(((Double) getCellValue(nextCell)).toString());
						else
							receipt.setChqDhr((String) getCellValue(nextCell));
						break;
					case 27:
						receipt.setFlag(((String) getCellValue(nextCell)));
						break;

					case 28:
						receipt.setTrCode(((String) getCellValue(nextCell)).charAt(0));
						break;

					case 29:
						receipt.setRemarks(((String) getCellValue(nextCell)));
						break;

					case 30:
						receipt.setrC(((String) getCellValue(nextCell)).charAt(0));
						break;

					case 31:
						receipt.setpD(((String) getCellValue(nextCell)));
						break;
					case 32:
						receipt.setAccode(((String) getCellValue(nextCell)));
						break;
					case 33:
						receipt.setBranch(((String) getCellValue(nextCell)));
						break;
					case 34:
						receipt.setdC(((String) getCellValue(nextCell)));
						break;
					case 35:
						receipt.setwLrDt(((java.util.Date) getCellValue(nextCell)));
						break;
					// case 35:
					// receipt.setCity(((String) getCellValue(nextCell)));
					// break;
					// case 36:
					// receipt.setUserId(((Double)
					// getCellValue(nextCell)).intValue());
					// break;
					// case 37:
					// receipt.setLastUpdate(((java.util.Date)
					// getCellValue(nextCell)));
					// break;

					}

				}

			}
			receipt.setAmount(d + e);
			receipt.setBalChq(balchq);
			receipt.setCity(" ");
			receipt.setUserId(0);
			receipt.setLastUpdate(null);
			receiptList.add(receipt);
		}

		workbook.close();
		inputStream.close();

		return receiptList;
	}

	public static List<ChequePayment> readChequePaymentFromExcelFile(String excelFilePath) throws IOException {
		List<ChequePayment> chequePaymentList = new ArrayList<>();
		FileInputStream inputStream = new FileInputStream(new File(excelFilePath));

		Workbook workbook = getWorkbook(inputStream, excelFilePath);
		Sheet firstSheet = workbook.getSheetAt(0); //////
		Iterator<Row> iterator = firstSheet.iterator();
		boolean firstRow = true;
		while (iterator.hasNext()) {
			Row nextRow = iterator.next();
			if (firstRow == true) {
				firstRow = false;
				nextRow = iterator.next();
			}
			Iterator<Cell> cellIterator = nextRow.cellIterator();
			ChequePayment chequePayment = new ChequePayment();

			while (cellIterator.hasNext()) {
				Cell nextCell = cellIterator.next();
				int columnIndex = nextCell.getColumnIndex();
				if (getCellValue(nextCell) != null) {
					switch (columnIndex) {
					case 0:
						if (getCellValue(nextCell) instanceof Double)
							chequePayment.setDocno(((Double) getCellValue(nextCell)).intValue());
						else
							chequePayment.setDocno(Integer.parseInt(((String) getCellValue(nextCell)).trim()));
						break;
					case 1:
						chequePayment.setDocDate((java.util.Date) getCellValue(nextCell));
						break;
					case 2:
						chequePayment.setBankCode(((String) getCellValue(nextCell)));
						break;
					case 3:
						chequePayment.setTransactionNo(((String) getCellValue(nextCell)));
						break;
					case 4:
						chequePayment.setChequeDate((java.util.Date) getCellValue(nextCell));
						break;
					case 5:
						chequePayment.setAmount((Double) getCellValue(nextCell));
						break;
					case 6:
						chequePayment.setCheqClDate((java.util.Date) getCellValue(nextCell));
						break;

					}
				}
			}
			chequePayment.setPaymentMode("Cheque");
			chequePaymentList.add(chequePayment);
		}

		workbook.close();
		inputStream.close();

		return chequePaymentList;
	}

	public static List<RefundPayment> readRefundPaymentFromExcelFile(String excelFilePath) throws IOException {
		List<RefundPayment> refundPaymentList = new ArrayList<>();
		FileInputStream inputStream = new FileInputStream(new File(excelFilePath));

		Workbook workbook = getWorkbook(inputStream, excelFilePath);
		Sheet firstSheet = workbook.getSheetAt(3); //////
		Iterator<Row> iterator = firstSheet.iterator();
		boolean firstRow = true;
		while (iterator.hasNext()) {
			Row nextRow = iterator.next();
			if (firstRow == true) {
				firstRow = false;
				nextRow = iterator.next();
			}
			Iterator<Cell> cellIterator = nextRow.cellIterator();
			RefundPayment refundPayment = new RefundPayment();

			while (cellIterator.hasNext()) {
				Cell nextCell = cellIterator.next();
				int columnIndex = nextCell.getColumnIndex();

				switch (columnIndex) {
				case 0:
					refundPayment.setPayType(((String) getCellValue(nextCell)));
					break;
				case 1:
					refundPayment.setMemberNo(((Double) getCellValue(nextCell)).intValue());
					break;
				case 2:
					refundPayment.setAmount(((Double) getCellValue(nextCell)).intValue());
					break;
				case 3:
					refundPayment.setTransactionNo(((String) getCellValue(nextCell)));
					break;
				case 4:
					refundPayment.setCdDate((java.util.Date) getCellValue(nextCell));
					break;
				case 5:
					refundPayment.setRemarks(((String) getCellValue(nextCell)));
					break;
				case 6:
					refundPayment.setpD(((String) getCellValue(nextCell)));
					break;
				case 7:
					refundPayment.setVoucherNo(((Double) getCellValue(nextCell)).intValue());
					break;
				case 8:
					refundPayment.setSlNo(((Double) getCellValue(nextCell)).intValue());
					break;
				case 9:
					refundPayment.setPaymentmode(((String) getCellValue(nextCell)));
					break;
				}

			}
			refundPaymentList.add(refundPayment);
		}

		workbook.close();
		inputStream.close();

		return refundPaymentList;
	}

	public static List<TransactionRecords> readTransactionRecordsFromExcelFile(String excelFilePath)
			throws IOException {
		List<TransactionRecords> transactionRecordsList = new ArrayList<>();
		FileInputStream inputStream = new FileInputStream(new File(excelFilePath));

		Workbook workbook = getWorkbook(inputStream, excelFilePath);
		Sheet firstSheet = workbook.getSheetAt(0); //////
		Iterator<Row> iterator = firstSheet.iterator();
		boolean firstRow = true;
		while (iterator.hasNext()) {
			Row nextRow = iterator.next();
			if (firstRow == true) {
				firstRow = false;
				nextRow = iterator.next();
			}
			Iterator<Cell> cellIterator = nextRow.cellIterator();
			TransactionRecords transactionRecord = new TransactionRecords();

			while (cellIterator.hasNext()) {
				Cell nextCell = cellIterator.next();
				int columnIndex = nextCell.getColumnIndex();
				if (getCellValue(nextCell) != null) {
					switch (columnIndex) {
					case 0:
						transactionRecord.setsNo(((Double) getCellValue(nextCell)).intValue());
						break;
					case 1:
						if ((getCellValue(nextCell)) instanceof Double)
							transactionRecord.setDocNo(((Double) getCellValue(nextCell)).intValue());
						else
							transactionRecord.setDocNo(Integer.parseInt(((String) getCellValue(nextCell)).trim()));
						break;
					case 2:
						transactionRecord.setSlno(((Double) getCellValue(nextCell)).intValue());
						break;
					case 3:
						transactionRecord.setDocDte((java.util.Date) getCellValue(nextCell));
						break;
					case 4:
						transactionRecord.setDocType((String) getCellValue(nextCell));
						break;
					case 5:
						transactionRecord.setAcCode((String) getCellValue(nextCell));
						break;
					case 6:
						transactionRecord.setBkCode((String) getCellValue(nextCell));
						break;
					case 7:
						transactionRecord.setChqNo((String) getCellValue(nextCell));
						break;
					case 8:
						transactionRecord.setChDate((java.util.Date) getCellValue(nextCell));
						break;
					case 9:
						transactionRecord.setBankBr((String) getCellValue(nextCell));
						break;
					case 10:
						transactionRecord.setMembNo(((Double) getCellValue(nextCell)).intValue());
						break;
					case 11:
						transactionRecord.setAmt((Double) getCellValue(nextCell));
						break;
					case 12:
						transactionRecord.setParti(((String) getCellValue(nextCell)));
						break;
					case 13:
						transactionRecord.setaP((String) getCellValue(nextCell));
						break;
					case 14:
						if ((getCellValue(nextCell)) instanceof Double)
							transactionRecord.setFlag(((Double) getCellValue(nextCell)).intValue());
						else
							transactionRecord.setFlag(Integer.parseInt(((String) getCellValue(nextCell)).trim()));
						break;
					case 15:
						transactionRecord.setVrNo(((Double) getCellValue(nextCell)).intValue());
						// //F_H name
						break;
					case 16:
						transactionRecord.setsN(((Double) getCellValue(nextCell)).toString());
						// Nominee name & relation
						break;
					case 17:
						transactionRecord.setsR((String) getCellValue(nextCell));
						break;
					case 18:
						transactionRecord.setDocNoo((String) getCellValue(nextCell));
						break;
					case 19:
						transactionRecord.setProjCd(((Double) getCellValue(nextCell)).intValue());
						break;
					case 20:
						transactionRecord.setWcLrDt((java.util.Date) getCellValue(nextCell));
						break;
					case 21:
						transactionRecord.setChClDt((java.util.Date) getCellValue(nextCell));
						break;
					case 22:

						transactionRecord.setcFlag((String) getCellValue(nextCell));
						break;
					case 23:
						if ((getCellValue(nextCell)) instanceof Double)
							transactionRecord.setPartyCd(((Double) getCellValue(nextCell)).intValue());
						else
							transactionRecord.setPartyCd(Integer.parseInt(((String) getCellValue(nextCell)).trim()));
						break;
					case 24:
						transactionRecord.setUserId(((Double) getCellValue(nextCell)).intValue());
						break;
					case 25:
						transactionRecord.setLastUpdate((java.util.Date) getCellValue(nextCell));
						break;
					}
				}
			}
			transactionRecordsList.add(transactionRecord);
		}

		workbook.close();
		inputStream.close();

		return transactionRecordsList;
	}

	public static boolean isNumeric(String str)  
	{  
	  try  
	  {  
	    double d = Double.parseDouble(str);  
	  }  
	  catch(NumberFormatException nfe)  
	  {  
	    return false;  
	  }  
	  return true;  
	}
	
	public static void main(String args[]) {
		// try {
		// System.out.println("Printing cheque Data");
		// List<ChequePayment> projectList =
		// ExcelToObjectUtility.readChequePaymentFromExcelFile("E:\\DHS\\DATA.xls");
		// for (ChequePayment p : projectList) {
		// System.out.println(p);
		// }
		// } catch (IOException ioe) {
		// ioe.printStackTrace();
		// } catch (NumberFormatException ioe) {
		// ioe.printStackTrace();
		// System.out.println("Please Input No. only");
		// } catch (Exception e) {
		// e.printStackTrace();
		// }

		// try {
		// System.out.println("Printing Member Data");
		// List<Members> projectList =
		// ExcelToObjectUtility.readMembersFromExcelFile("E:\\DHS\\MEMBER_DATA_FROM_1_TO_1000.xls");
		// MembersDao mdao=new MembersDao();
		// for (Members p : projectList) {
		// System.out.println(p);
		// mdao.create(p);
		// }
		// } catch (IOException ioe) {
		// ioe.printStackTrace();
		// } catch (NumberFormatException ioe) {
		// ioe.printStackTrace();
		// System.out.println("Please Input No. only");
		// } catch (Exception e) {
		// e.printStackTrace();
		// }

		// try {
		// System.out.println("Printing Transaction Data");
		// List<RefundPayment> projectList = ExcelToObjectUtility
		// .readRefundPaymentFromExcelFile("E:\\DHS\\TR9900_DATA.xls");
		// RefundPaymentDao tDao=new RefundPaymentDao();
		// for (RefundPayment p : projectList) {
		// tDao.create(transaction, refundPayment);
		// System.out.println(p);
		// }
		// } catch (IOException ioe) {
		// ioe.printStackTrace();
		// } catch (NumberFormatException ioe) {
		// ioe.printStackTrace();
		// System.out.println("Please Input No. only");
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
	}
}
