package com.vedisoft.danishhousing.config;

import java.io.IOException;
import java.util.List;

import com.vedisoft.danishhousing.pojos.*;
import com.vedisoft.danishhousing.daos.*;

public class ExcelToSqlImport {

	public static void importProject(String file) {
		try {
			System.out.println("Printing Project Data");
			List<Projects> projectList = ExcelToObjectUtility
					.readProjectsFromExcelFile(file);
			ProjectsDao pDao = new ProjectsDao();
			for (Projects p : projectList) {
				pDao.create(p);
				System.out.println(p);
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (NumberFormatException ioe) {
			ioe.printStackTrace();
			System.out.println("Please Input No. only");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void importAccount(String file) {
		try {
			System.out.println("Printing Transaction Data");
			List<Account> acList = ExcelToObjectUtility
					.readAccountFromExcelFile(file);
			AccountDao acDao = new AccountDao();
			for (Account acc : acList) {
				acDao.create(acc);
				System.out.println(acc);
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (NumberFormatException ioe) {
			ioe.printStackTrace();
			System.out.println("Please Input No. only");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void importAccountMaster(String file) {
		try {
			System.out.println("Printing AccountMaster Data");
			List<AccountMaster> acList = ExcelToObjectUtility
					.readAccountMasterFromExcelFile(file);
			AccountMasterDao acDao = new AccountMasterDao();
			for (AccountMaster acc : acList) {
				acDao.create(acc);
				System.out.println(acc);
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (NumberFormatException ioe) {
			ioe.printStackTrace();
			System.out.println("Please Input No. only");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void importMembers(String file) {
		try {
			System.out.println("Printing Member Data");
			List<Members> memberList = ExcelToObjectUtility
					.readMembersFromExcelFile(file);
			MembersDao mdao = new MembersDao();
			for (Members m : memberList) {
				System.out.println(m);
				//mdao.createImport(m);
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (NumberFormatException ioe) {
			ioe.printStackTrace();
			System.out.println("Please Input No. only");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void importReceiptRecord(String file) {
		try {
			System.out.println("Printing Receipt Data");
			List<ReceiptRecord> receiptList = ExcelToObjectUtility
					.readReceiptRecordFromExcelFile(file);
			ReceiptDao recDao = new ReceiptDao();
			for (ReceiptRecord rec : receiptList) {
				//recDao.createForImport(rec);
				System.out.println(rec);
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (NumberFormatException ioe) {
			ioe.printStackTrace();
			System.out.println("Please Input No. only");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void importTransactionRecord(String file) {
		try {
			System.out.println("Printing Transaction Data");
			List<TransactionRecords> transactionList = ExcelToObjectUtility
					.readTransactionRecordsFromExcelFile(file);
			ChequePaymentDao cpDao = new ChequePaymentDao();
			for (TransactionRecords tr : transactionList) {
				cpDao.create(tr);
				System.out.println(tr);
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (NumberFormatException ioe) {
			ioe.printStackTrace();
			System.out.println("Please Input No. only");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void importChequePyment(String file) {
		try {
			System.out.println("Printing cheque Data");
			List<ChequePayment> cpList = ExcelToObjectUtility.readChequePaymentFromExcelFile(file);
			ChequePaymentDao cpDao = new ChequePaymentDao();
			for (ChequePayment cp : cpList) {
				cpDao.createCheque(cp);
				System.out.println(cp);
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (NumberFormatException ioe) {
			ioe.printStackTrace();
			System.out.println("Please Input No. only");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void importRefundPayent(String file) {
		try {
			System.out.println("Printing Transaction Data");
			List<RefundPayment> rpList = ExcelToObjectUtility
					.readRefundPaymentFromExcelFile(file);
			RefundPaymentDao tDao = new RefundPaymentDao();
			for (RefundPayment rp : rpList) {
				tDao.create(rp);
				System.out.println(rp);
			}
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (NumberFormatException ioe) {
			ioe.printStackTrace();
			System.out.println("Please Input No. only");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		//importProject("I:\\PROJFL.xls");
		//importAccount("I:\\DHS\\BKMAS.xls");
		//importAccountMaster("I:\\DHS\\ACMAST.xls");
		//importMembers("I:\\DHS\\MEMBFL11.xls");
		//importReceiptRecord("I:\\DHS\\RCPFLD.xls");
		importTransactionRecord("C:\\Users\\AMAN\\Desktop\\Rohot ji-20-01-2018\\TR9900Z4.xls");
		//importChequePyment("I:\\DHS\\CHREG1.xls");
		//importRefundPayent("I:\\DHS\\REFUND1.xls");
	}

}
