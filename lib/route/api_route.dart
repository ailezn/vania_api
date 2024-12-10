import 'package:vania/vania.dart';
import 'package:praktik/app/http/controllers/customers_controller.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    // Create Customer
    Router.post('/customers', customersController.create);

    // Get All Customers
    Router.get('/customers', customersController.index);

    // Get Customer by ID
    Router.get('/customers/:id', (int id) {
      return customersController.show(id);
    });
  }
}
