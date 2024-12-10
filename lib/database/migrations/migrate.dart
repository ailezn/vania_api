import 'dart:io';
import 'package:praktik/database/migrations/create_customers_table.dart';
import 'package:praktik/database/migrations/create_orders_table.dart';
import 'package:praktik/database/migrations/create_product_table.dart';
import 'package:vania/vania.dart';
import 'create_users_table.dart';
import 'create_order_item_table.dart';
import 'create_productnotes_table.dart';
import 'create_vendors_table.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
     await CreateUserTable().up();
		 await CreateCustomersTable().up();
    await CreateProductsTable().up();
		await CreateProductnotesTable().up();
		 await CreateVendorsTable().up();
    await CreateOrdersTable().up();
    await CreateOrderitemTable().up();
	}

  dropTables() async {
		 await CreateVendorsTable().down();
		 await CreateProductnotesTable().down();
		 await CreateCustomersTable().down();
		 await CreateUserTable().down();
	 }
}
