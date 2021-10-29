// Copyright (c) 2021, logesh and contributors
// For license information, please see license.txt

frappe.ui.form.on('Sales Point', {
	// refresh: function(frm) {

	// }
	c_primary_address: function(frm) {
		if (frm.doc.c_primary_address) {
			frappe.call({
				method: 'frappe.contacts.doctype.address.address.get_address_display',
				args: {
					"address_dict": frm.doc.c_primary_address
				},
				callback: function(r) {
					frm.set_value("primary_address", r.message);
					frm.refresh_fields();
				}
			});
		}
		if (!frm.doc.c_primary_address) {
			frm.set_value("primary_address", "");
		}
	}
});