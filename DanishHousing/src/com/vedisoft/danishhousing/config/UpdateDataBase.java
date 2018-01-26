package com.vedisoft.danishhousing.config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.vedisoft.danishhousing.pojos.*;
import com.vedisoft.danishhousing.daos.*;

public class UpdateDataBase {
	public static void deleteReceiptRecord(String file) {
		try {
			System.out.println("Printing Receipt Data");
			List<ReceiptRecord> receiptList = ExcelToObjectUtility.readReceiptRecordFromExcelFile(file);
			List<ReceiptRecord> receiptCheckList=new ArrayList<ReceiptRecord>();
			ReceiptDao recDao = new ReceiptDao();
			int counter=0;
			for (ReceiptRecord rec : receiptList) {
				System.out.println(rec);
				boolean status = recDao.remove(rec);
				if (status == false){
					System.out.println("Nothing to delete");
					receiptCheckList.add(rec);
					counter++;
				}	
			}
			System.out.println(counter);
			for (ReceiptRecord rec : receiptCheckList) 
				System.out.println(rec);
			// for (ReceiptRecord rec : receiptList) {
			// int count = recDao.count(rec);
			// System.out.println(count);
			// if (count > 1) {
			// System.out.println("Count > 1");
			// while (count > 1) {
			// System.out.println("Deleting record");
			// recDao.remove(rec);
			// count = recDao.count(rec);
			// System.out.println(rec.getReceiptNo());
			// }
			// } else if(count==1){
			// System.out.println("Deleting record.....");
			// recDao.remove(rec);
			// }
			// System.out.println(rec);
			// }
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (NumberFormatException ioe) {
			ioe.printStackTrace();
			System.out.println("Please Input No. only");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void deleteRefundPayRecord(String file) {
		try {
			System.out.println("Printing Receipt Data");
			List<RefundPayment> refundPayList = ExcelToObjectUtility.readRefundPaymentFromExcelFile(file);
			List<RefundPayment> receiptCheckList=new ArrayList<RefundPayment>();
			RefundPaymentDao recDao = new RefundPaymentDao();
			int counter=0;
			for (RefundPayment rec : refundPayList) {
				System.out.println(rec);
				boolean status=recDao.remove(rec);
				if (status == false){
					System.out.println("Nothing to delete");
					receiptCheckList.add(rec);
					counter++;
				}
System.out.println(counter);
			}
			// for (RefundPayment rec : refundPayList) {
			// int count = recDao.count(rec);
			// System.out.println(count);
			// if (count > 1) {
			// System.out.println("Count > 1");
			// while (count > 1) {
			// System.out.println("Deleting record......");
			// recDao.remove(rec);
			// count = recDao.count(rec);
			// System.out.println(rec.getVoucherNo());
			// }
			// } else if(count==1){
			// System.out.println("Deleting record.....");
			// recDao.remove(rec);
			// }
			// //System.out.println(rec);
			// }
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} catch (NumberFormatException ioe) {
			ioe.printStackTrace();
			System.out.println("Please Input No. only");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void updateTransactionRecord(String file) {
		try {
			System.out.println("Printing Receipt Data");
			List<TransactionRecords> transactionList = ExcelToObjectUtility.readTransactionRecordsFromExcelFile(file);
			TransactionRecordsDao tranDao = new TransactionRecordsDao();
			for (TransactionRecords tran : transactionList) {
				System.out.println(tran);

			}
			for (TransactionRecords tran : transactionList) {
				tranDao.updateDeletedRecords(tran);
				// int count = tranDao.count(tran);
				// System.out.println(count);
				// if (count > 1) {
				// System.out.println("Count > 1");
				// while (count > 1) {
				// System.out.println("Updating record");
				// tranDao.updateDeletedRecords(tran);
				// count=tranDao.count(tran);
				// System.out.println(count);
				// System.out.println(tran.getDocNo());
				// }
				// } else if(count==1){
				// System.out.println("Updating record.....");
				// tranDao.updateDeletedRecords(tran);
				// }
				// System.out.println(rec);
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
		// importProject("I:\\PROJFL.xls");
		// importAccount("I:\\DHS\\BKMAS.xls");
		// importAccountMaster("I:\\DHS\\ACMAST.xls");
		// importMembers("I:\\DHS\\MEMBFL11.xls");
		//deleteReceiptRecord("D:\\DELETE_DATA-20-12-2017 .xls");
		// deleteReceiptRecord("D:\\Book1.xls");
		// importTransactionRecord("I:\\DHS\\TR9900Z2.xls");
		// updateTransactionRecord("D:\\DELETE_DATA-20-12-2017.xls");
		// importChequePyment("I:\\DHS\\CHREG1.xls");
		// importRefundPayent("I:\\DHS\\REFUND1.xls");
		 deleteRefundPayRecord("D:\\DELETE_DATA-20-12-2017 .xls");
	}
}
