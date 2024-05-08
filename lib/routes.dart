import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:jar_waters/language.dart';
 import 'package:jar_waters/core/constant/routes.dart';
 import 'package:jar_waters/core/middleware/myMiddleware.dart';
import 'package:jar_waters/view/screen/Admin/home.dart';
import 'package:jar_waters/view/screen/CustomerOrders/customerOrders.dart';
import 'package:jar_waters/view/screen/Customers/customers.dart';
import 'package:jar_waters/view/screen/Districts/Districts.dart';
import 'package:jar_waters/view/screen/DriverOrders/add.dart';
import 'package:jar_waters/view/screen/DriverOrders/edit.dart';
import 'package:jar_waters/view/screen/DriverOrders/homePageOrders.dart';
import 'package:jar_waters/view/screen/DriverOrders/view.dart';
import 'package:jar_waters/view/screen/Drivers/Login-Driver.dart';
import 'package:jar_waters/view/screen/Drivers/drivers.dart';
import 'package:jar_waters/view/screen/Serepta/serepta.dart';
import 'package:jar_waters/view/screen/Towns/towns.dart';
import 'package:jar_waters/view/test/test1.dart';

// import 'package:water_jar/view/screen/Admin/home.dart';
// import 'package:water_jar/view/screen/Admin/login.dart';
// import 'package:water_jar/view/screen/Admin/register.dart';
// import 'package:water_jar/view/screen/Bottels/add.dart';
// import 'package:water_jar/view/screen/Bottels/edit.dart';
// import 'package:water_jar/view/screen/Bottels/view.dart';
// import 'package:water_jar/view/screen/Jars/add.dart';
// import 'package:water_jar/view/screen/Jars/edit.dart';
// import 'package:water_jar/view/screen/Jars/view.dart';
// import 'package:water_jar/view/screen/Customers/add.dart';
// import 'package:water_jar/view/screen/Customers/edit.dart';
// import 'package:water_jar/view/screen/Customers/view.dart';
// import 'package:water_jar/view/screen/Days/view.dart';
// import 'package:water_jar/view/screen/Districts/add.dart';
// import 'package:water_jar/view/screen/Districts/edit.dart';
// import 'package:water_jar/view/screen/Districts/view.dart';
// import 'package:water_jar/view/screen/Drivers/add.dart';

// import 'package:water_jar/view/screen/Drivers/edit.dart';
// import 'package:water_jar/view/screen/Drivers/view.dart';
// import 'package:water_jar/view/screen/Order/add.dart';
// import 'package:water_jar/view/screen/Order/edit.dart';
// import 'package:water_jar/view/screen/Order/homePage.dart';
// import 'package:water_jar/view/screen/Order/login-Driver.dart';
// import 'package:water_jar/view/screen/Order/view.dart';
// import 'package:water_jar/view/screen/Towns/add.dart';
// import 'package:water_jar/view/screen/Towns/edit.dart';

// import 'package:water_jar/view/screen/Towns/view.dart';
// import 'package:water_jar/view/screen/test/testu.dart';
// import 'package:water_jar/view/screen/test1.dart';
// import 'package:water_jar/view/screen/townsss.dart';




List<GetPage<dynamic>>? routes = [

   GetPage(name:  "/", page: () => const Language(), middlewares: [MyMidlleware()]),
 

    //  GetPage(name:  AppRoute.test1, page: () => const Test1(),),
     GetPage(name:  AppRoute.townss, page: () => const ViewTownss(),),
     GetPage(name:  AppRoute.districtss, page: () => const ViewDistrictss(),),
     GetPage(name:  AppRoute.sereptass, page: () => const ViewSerepta(),),
     GetPage(name:  AppRoute.driverss, page: () => const ViewDrivers(),),
     GetPage(name:  AppRoute.customerss, page: () => const ViewCustomers(),),
     GetPage(name:  AppRoute.customerOrderss, page: () => const ViewCustomerOrders(),),
     GetPage(name:  AppRoute.homeAdminPagess, page: () => const HomeAdminPage(),),
    //  GetPage(name:  AppRoute.homeOrdersPagess, page: () => const HomePageOrders(),),




      GetPage(name: AppRoute.driverLogin, page: () => const DriverLogin()),
      GetPage(name: AppRoute.orderadd, page: () => const AddOrder()),


         GetPage(name: AppRoute.ordersViewBydriverid, page: () => const ViewOrdersByDrivers()),
         GetPage(name: AppRoute.orderedits, page: () => const EditOrder()),

          GetPage(name: AppRoute.homeOrdersPagess, page: () => const DriversOrdersHomePage()),

       






    // GetPage(name:  AppRoute.testu, page: () =>  MyForm(),),


    // // Days
    // GetPage(name:  AppRoute.viewdays, page: () => const ViewDays(),),


    
    //  // Admin
    // GetPage(name:  AppRoute.home, page: () => const HomeAdminPage(),),
    // GetPage(name:  AppRoute.adminlogin, page: () => const AdminLogin(),),
    // GetPage(name:  AppRoute.adminregister, page: () => const AdminRegister(),),


    
    // // DRIVERS
    // GetPage(name:  AppRoute.driveradd, page: () => const AddDriver(),),
    // GetPage(name:  AppRoute.driveredit, page: () => const EditDriver(),),
    // GetPage(name:  AppRoute.driversview, page: () => const ViewDrivers(),),


    // // TOWNS
    // GetPage(name:  AppRoute.townadd, page: () => const AddTown(),),
    // GetPage(name:  AppRoute.townedit, page: () => const EditTown(),),
    // GetPage(name:  AppRoute.townview, page: () => const ViewTowns(),),
    

    // // Districts
    // GetPage(name:  AppRoute.districtadd, page: () => const AddDistrict(),),
    // GetPage(name:  AppRoute.districtedit, page: () => const EditDistrict(),),
    // GetPage(name:  AppRoute.districtview, page: () => const ViewDistreicts(),),

    
    // // Customers
    // GetPage(name:  AppRoute.customeradd, page: () => const AddCustomer(),),
    // GetPage(name:  AppRoute.customeredit, page: () => const EditCustomer(),),
    // GetPage(name:  AppRoute.customerview, page: () => const ViewCustomers(),),


    // // Company
    // GetPage(name:  AppRoute.jaradd, page: () => const AddJar(),),
    // GetPage(name:  AppRoute.jaredit, page: () => const EditJar(),),
    // GetPage(name:  AppRoute.jarview, page: () => const ViewJars(),),



    // // Botels
    // GetPage(name:  AppRoute.bottelsadd, page: () => const AddBottels(),),
    // GetPage(name:  AppRoute.bottelsedit, page: () => const EditBottels(),),
    // GetPage(name:  AppRoute.bottelsview, page: () => const ViewBottels(),),



    // // Orders
    //  GetPage(name: AppRoute.driverLogin, page: () => const DriverLogin()),

    // GetPage(name: AppRoute.ordersHomePage, page: () => const OrdersHomePage()),

    // GetPage(name: AppRoute.orderadd, page: () => const AddOrder()),
    // GetPage(name: AppRoute.orderedit, page: () => const EditOrder()),
    // GetPage(name: AppRoute.ordersViewBydriverid, page: () => const ViewOrdersByDrivers()),


















    




















];



