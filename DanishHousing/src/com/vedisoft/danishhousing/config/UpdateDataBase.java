package com.vedisoft.danishhousing.config;

import java.io.IOException;
import java.util.List;

import com.vedisoft.danishhousing.pojos.*;
import com.vedisoft.danishhousing.daos.*;

public class UpdateDataBase {
	public static void deleteReceiptRecord(String file) {
		try {
			System.out.println("Printing Receipt Data");
			List<ReceiptRecord> receiptList = ExcelToObjectUtility.readReceiptRecordFromExcelFile(file);
			ReceiptDao recDao = new ReceiptDao();
			for (ReceiptRecord rec : receiptList) {
				int count = recDao.count(rec);
				System.out.println(count);
				if (count > 1) {
					System.out.println("Count > 1");
					while (count > 1) {
						System.out.println("Deleting record");
						recDao.remove(rec);
						count = recDao.count(rec);
					}
				} else if(count==1){
					System.out.println("Deleting record.....");
					recDao.remove(rec);
				}
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

	public static void main(String[] args) {
		//importProject("I:\\PROJFL.xls");
		// importAccount("I:\\DHS\\BKMAS.xls");
		// importAccountMaster("I:\\DHS\\ACMAST.xls");
		// importMembers("I:\\DHS\\MEMBFL11.xls");
		 deleteReceiptRecord("D:\\DELETE_DATA-20-12-2017.xls");
		 //deleteReceiptRecord("D:\\Book1.xls");
		// importTransactionRecord("I:\\DHS\\TR9900Z2.xls");
		// importChequePyment("I:\\DHS\\CHREG1.xls");
		// importRefundPayent("I:\\DHS\\REFUND1.xls");
	}
}
