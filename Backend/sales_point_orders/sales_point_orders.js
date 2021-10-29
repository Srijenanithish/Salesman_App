// Copyright (c) 2021, logesh and contributors
// For license information, please see license.txt

frappe.ui.form.on('Sales Point Orders', {
	// refresh: function(frm) {

	// }
});
frappe.ui.form.on('Sales Point Orders Items', {
	// refresh: function(frm) {

	// }
	item_code: function(frm,cdt,cdn) {
		const d=locals[cdt][cdn]
		frappe.db.get_value("Item Price",{"item_code":d.item_code,'selling':1},'price_list_rate', (r) => {
			if (r.price_list_rate) {
				frappe.model.set_value(cdt,cdn,"rate",r.price_list_rate);
				frappe.model.set_value(cdt,cdn,"net_rate",r.price_list_rate);
			}
		});
	},
	qty: function(frm,cdt,cdn) {
		const d=locals[cdt][cdn]
		frappe.model.set_value(cdt,cdn,"amount",d.rate*d.qty);
		frappe.model.set_value(cdt,cdn,"net_amount",d.rate*d.qty);
		frm.set_value("total_quantity",d.qty);
		frm.set_value("total",d.rate*d.qty);
		frm.set_value("net_total",d.rate*d.qty);
	}
});