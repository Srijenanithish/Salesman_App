# Copyright (c) 2021, logesh and contributors
# For license information, please see license.txt

import frappe
from frappe.model.document import Document
from frappe.utils import  nowdate, add_days, today

class SalesPointOrders(Document):
	pass

@frappe.whitelist()
def make_sales_order():
	spo_list =frappe.get_all("Sales Point Orders",{"primary_sales_order":'', 'docstatus':0}, ['*'])
	print(spo_list)
	grouped_by_customer={}
	for row in spo_list:
		if row['salespoint'] not in grouped_by_customer:
			print(row['salespoint'])
			grouped_by_customer[row['salespoint']]=[row['name']]
		else:
			grouped_by_customer[row['salespoint']].append(row['name'])
	print(grouped_by_customer)
	for salespoint in grouped_by_customer:
		so_items  = frappe.db.get_all('Sales Point Orders Items', {'parent':['in', grouped_by_customer[salespoint]]}, [
			"*"
		])
		so= frappe.new_doc('Sales Order')
		for row in so_items:
			so.append('items', row)
			print(row)
		so.delivery_date = add_days(today(), 5)
		so.customer = frappe.db.get_value('Sales Point', salespoint, 'default_distributor')
		print(so.customer )
		so.transaction_date = nowdate()
		so.order_type = "Sales"
		so.save()
		for spo_name in grouped_by_customer[salespoint]:
			frappe.db.set_value('Sales Point Orders', spo_name, 'primary_sales_order', so.name)
